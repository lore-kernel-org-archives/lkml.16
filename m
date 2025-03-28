Received: from mail.hows.id.au (125-63-26-112.ip4.superloop.au [125.63.26.112])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3BA17BCE;
	Fri, 28 Mar 2025 00:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=125.63.26.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743122291; cv=none; b=ImMQ43/y3Q6OsTE2kWDlXVLyqceX/GcCK7a7UqQAOOhhKyHg30MxL2rJkeAzrIgxAuYIsdPW4Hy14KlwgKpgG+n6ID+1pHXq1SytPNqgOpbe5Br/VK/BrRno+OT1wtCSp9+URGkeqyyhVj1VfIpxKJAwEnwdixRBI2nkHbflazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743122291; c=relaxed/simple;
	bh=wtBvftpEg26IjFYgtQd0GAUwiZoqlDE7NzpImEwU1lU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WD42qNQVv5GdTK/c8dh6yi1Ho0tcGE+cJF8VvMQqqjSer/PpfpXUo47Zl6jtO7T2wAqjRJNpf0K+wQ/wQWRz4V97Y4DNSJLkmehP9KbAj5XyJel5yzy3lcZi4kHqYL6MLx06C9b1JQ6texDJzCn4nB6rWg1gJv+NYiy+t0dJRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hows.id.au; spf=pass smtp.mailfrom=hows.id.au; arc=none smtp.client-ip=125.63.26.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hows.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hows.id.au
Received: by mail.hows.id.au (Postfix, from userid 113)
	id 7B07522F18; Fri, 28 Mar 2025 11:38:05 +1100 (AEDT)
X-Spam-Level: 
Received: from archibald.hows.id.au (unknown [192.168.0.157])
	by mail.hows.id.au (Postfix) with ESMTPSA id 861CC229C3;
	Fri, 28 Mar 2025 11:37:58 +1100 (AEDT)
Date: Fri, 28 Mar 2025 11:37:57 +1100
From: David Hows <david@hows.id.au>
To: Clemens Ladisch <clemens@ladisch.de>, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH]hwmon: (k10temp) Add support for Zen5 Ryzen Desktop
Message-ID: <Z-XvZRmVXMNHgi3e@archibald.hows.id.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add support for retrieving CCD temperatures on Granite Ridge Ryzen Desktop CPUs

Tested locally against my 9950X3D CPU.
---
 drivers/hwmon/k10temp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
index d0b4cc9a5011..cc2ad7a324f9 100644
--- a/drivers/hwmon/k10temp.c
+++ b/drivers/hwmon/k10temp.c
@@ -502,6 +502,13 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			k10temp_get_ccd_support(data, 12);
 			break;
 		}
+	} else if (boot_cpu_data.x86 == 0x1a) {
+		switch (boot_cpu_data.x86_model) {
+		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop*/
+			data->ccd_offset = 0x308;
+			k10temp_get_ccd_support(data, 8);
+			break;
+		}
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tctl_offset_table); i++) {
-- 
2.49.0

