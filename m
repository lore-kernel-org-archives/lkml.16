Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0761E2821
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322720; cv=none; b=I1k1dZpoZo0nc8HgJtcMhLRWWc2HCuMO/fYsXxaB3ENVd2gTzOW8MGHAHZTqdpkOFS7mICoWrMz2UIhYnE/58VPqY8n1lSY9AbQ1n416rWSRMR4QkUqdufO8KKifsZANZki0bLeaKX7ohx/VH+m4ddl+iyTcekYS2mQ25kCte1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322720; c=relaxed/simple;
	bh=dn+DuSMwXmxU+1JfTRIj8nX1GA6XGv4XdKBQ+XxFVgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=HKkUvK+AD7gwWE+J21lHlE6zkoApO1mXzXNYNAqLcldUKsW6/aTz1ZZVcAHs1EeGgYM+4HpsNcmozQo4UP6g51BECMk0QBlFYNm2mdLYhfbVZ7b9GVpcf7wMqgUIkow7Lt0mYbkfZivzNgxWLD5dpcJUsKjRGCLPXhnho8zQlqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1837AFEC;
	Fri, 31 Jan 2025 03:25:44 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76ED3F63F;
	Fri, 31 Jan 2025 03:25:17 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:12 +0000
Subject: [PATCH v2 12/18] firmware: arm_ffa: Reject higher major version as
 incompatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-12-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=dn+DuSMwXmxU+1JfTRIj8nX1GA6XGv4XdKBQ+XxFVgQ=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQqqizgtsYtZ73bbYEh3Wj6nROHylyl65QS
 auIrx9J3VqJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mJKpD/43GTqRDy1jK37kf+bolvnOdK/SY9f3bCx+Pudp3IvfrG/7kqhrU+jmHphcOpyvtjC0pI9
 tfdamBHGY2NnoVT4IXeJI7a1hugCsv9p1RFDbhLwmFMK1n2iQxXvcrFlMECnVkNreknobgLNwhG
 /phr5q2w9RF1/MH3HjPooxNYUqlh+Z3XvDQoaVndoZhCkdEef+X8PKr+8jPkDT1sK7a65qDuLcc
 gb8D2P4TsJAuGyEdBFZwWx7kxYHSpzxMN5pHMmzV3Nc3y7GYFYdRDL3u7Md2+xd0nSb4nDuPMHo
 ayCGMj46nJ19F+HMGGdAHiGlOf8Rywm+NjQC0UJ60eUU7hNApnX/3oM9NYJBvkZrGsV2Zv0KDnq
 MTx6T7Eko8KcJ8Ej/LIyUQnkWLDwazPiBYJ78z0M8QVDZz4NtSM0jaszQrSUMUGrT2BrKhgMQlx
 erovKG93QaRU/NWNOcKQzR5/9Dj/oAU7N6qXJBgF0iYsJ+LfqHH8ylWDTnzHwRclPHPvf9Q2ZHh
 3dWRoQxE9afol2H8RMa/rIE4OuYskjD8STMqPEUZ665qwoMyLEr/4n//LJzvyQAJG0nYx1aH2+0
 4awiCuW2/PdvH2QjWiNxkpKwjASbISpe45ahDYyrKxG0cjX5Pni6+/gPLhP6bsE/NOCWo2BbxKY
 yr1JeYspMtSwf3Q==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

When the firmware compatibility was handled previously in the commit
8e3f9da608f1 ("firmware: arm_ffa: Handle compatibility with different firmware versions"),
we only addressed firmware versions that have higher minor versions
compared to the driver version which is should be considered compatible
unless the firmware returns NOT_SUPPORTED.

However, if the firmware reports higher major version than the driver
supported, we need to reject it. If the firmware can work in a compatible
mode with the driver requested version, it must return the same major
version as requested.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 8188c8dd3ed6ceb9e9966148b42ef2f88baa6dd3..1a0f2d1d7a2220e341d4e78240e799a2919fca30 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -150,6 +150,14 @@ static int ffa_version_check(u32 *version)
 		return -EOPNOTSUPP;
 	}
 
+	if (FFA_MAJOR_VERSION(ver.a0) > FFA_MAJOR_VERSION(FFA_DRIVER_VERSION)) {
+		pr_err("Incompatible v%d.%d! Latest supported v%d.%d\n",
+		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),
+		       FFA_MAJOR_VERSION(FFA_DRIVER_VERSION),
+		       FFA_MINOR_VERSION(FFA_DRIVER_VERSION));
+		return -EINVAL;
+	}
+
 	if (ver.a0 < FFA_MIN_VERSION) {
 		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
 		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),

-- 
2.34.1

