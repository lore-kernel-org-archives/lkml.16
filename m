Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EF26773F;
	Fri,  2 May 2025 07:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171958; cv=none; b=FokimrFEpl4Y8sJu/M95OVcz24POt9q7LUGKTVrd7m1mrAmIxYZYn+U01VV6GLXdtuJHrGh0rOHE3jo4BYlXc56cuJN0X+bOFln8W4T0FIKkocJo7NkHbuG5yE5IQWAO3O2BwsLSYD4YOtzVS888mptRwoBVGvnRjgewHdL5s5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171958; c=relaxed/simple;
	bh=X3uP7v9fveDTGCV/msaaTp84y5PUa5NPgf4Fr5c2NkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+wd1frPxajBbRZdR9kyZhrhfVnR/x8FFfClb78c4kRBS6rnoYaYEsbRl0xGUXn0bsO9K5OkdJsBJ5kk+e1Q51Be4ccmi3qPqvUZfS3t+/eKz8M2uwruO0ihkTzJRAWEawvnQG19exA4CfTFjmAdgUXT4m/PnbbsPmmuAxmjViA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcYA8JZx; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcYA8JZx"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227cf12df27so16862755ad.0;
        Fri, 02 May 2025 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746171956; x=1746776756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nr3uc/BuQAGaiplQ7OFovwD1jVNfwOYK+HpPvLkKsh4=;
        b=YcYA8JZxBKuTsoHzcVS72Azli/2qTDsPHt2Y/mzEkHl5e/BVpWLi7MODgDSwd3nEni
         glCIgnUeQJGKH4j9tkyeNWzVumUsisHmhLBP+C3e0M5kr2sCOQLXaUYgvZKy0L9eFbEu
         hncExQ1pBUDvOZLWKPBLeY7w3Gl7DPCN2kRFtiBLfmBo/dbNbE09ogDvfksoKZ8z4wo/
         U1qsnFPq7M+ge2k4PpZNTSIPkG0lkVThUllnu11/haPGSdOgFQZjRZdCLkCmcgQMXbu9
         UvsCP4i9EN88nmEv53E1piYurrAVP8LU5+2pgrP6TOlFMUNX8QoXZ7vi3yMMnuVGAXCE
         3zSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746171956; x=1746776756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nr3uc/BuQAGaiplQ7OFovwD1jVNfwOYK+HpPvLkKsh4=;
        b=IdZvs6ut2lhPZeeHnS9SgdX+HdIUr8b46e/9t0yese0r6WCAx1gTyvLynziTArjnOd
         mqer+cIf0DecFpImK6iEE/ec0kKPNkz7Hlg/tttGondiBATQ78eI2FJlqXUVof+U7w5A
         yniB3FCn8yRKlLnRfgvZLCAG6IcR34kdL32VNqqKySjDSmB0haGsGQkq/mV3a+HIN930
         PrFX78zYYQVJBE37xB6oPJRUeV80eQ1y5dNwzC3rgQ38es3eM5xyMeY0BMWMVn3jAeIr
         MWaiLwHny1DCkw2VyiSGht5OWCu9IhXULqIQ1bbZ7qcFtpzM3TD4jY8SwtifH3Omv2WD
         UcuA==
X-Forwarded-Encrypted: i=1; AJvYcCXCfHozmJW2dnU7E2O9yOzQboxEtq7NzZ2W3sJCigZ3iACT2rOA2NyWgRnZn4Uy5MOBkng7aBacstE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8XruGP6bf0bi1kkon+EbIHXvrO7YY9alPTbNYDRFwx92xrUpm
	EIYP0OiQV153QRRtaLEhhvVGcJqaZw+V4c57n91hXsR7+Vi7a3z/
X-Gm-Gg: ASbGncuxte+IHWRBpeuNUwvIEWmXdnDs7/KEt/IOOW8beBvEeDqHWWTQEb9Vj77VKA3
	Wi9MdFIl+/use0R6nZWauzNFjuqyoNZJhdNhxuTbf3gLVb0mNri1W9GdKBq7fwUrJhBzzgXDwOb
	HyzHGEEjikOFFOyizJkYYvSYj3IRjKyepOvf2uphnEsCe90b9NBqStkBV1u8JZJpJW0dc20w6tH
	N/1pohgvq+3oU4VcWjGFf4AHjLi8jvy0HfokD8e6opSPsjNVdPYh22SjF+zx3vWuZtotDWe2XeZ
	OK2NBqVJLUGJZAedgis7nF3o3pM7Ku49G1AMHTKO
X-Google-Smtp-Source: AGHT+IG4krSXcYUW37s+vQA+xQDC716tvEz/O4UtgQjrB7hIGhgogg1UugtqDEfl8ASMq/rlQPjtMg==
X-Received: by 2002:a17:903:3c47:b0:215:58be:3349 with SMTP id d9443c01a7336-22e1007d2bamr36744635ad.14.1746171956287;
        Fri, 02 May 2025 00:45:56 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152326f7sm1188375ad.227.2025.05.02.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:45:55 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 32E6F420A6AB; Fri, 02 May 2025 14:45:53 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alyssa Ross <hi@alyssa.is>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>,
	Eric Biggers <ebiggers@google.com>,
	Jan Kara <jack@suse.cz>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Lee Jones <lee@kernel.org>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] Documentation: ioctl-number: Update outdated submission info
Date: Fri,  2 May 2025 14:45:05 +0700
Message-ID: <20250502074504.26933-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2201; i=bagasdotme@gmail.com; h=from:subject; bh=vF+0hLDaUpfcc1JpysrOmDrmp3tHznnlazht2GryoYs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBki5SJzAvyZ2fz6BTcJLl4utXeW8UQr9d+PTlr+L/Dbu NSBS0O8o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABN5M5eRYUv7P66bF0K/vfz4 1WxVmltmeO+V0pKV5/1zSyPK+81YjBj+Cv3g5M2Je+VQFCqhsDyy6tN9gTX7E47q7tjWWHdjxvy 57AA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Much like device numbers that used to be assigned by LANANA (see commit
ebdf4040c16df5 ("Documentation: update the devices.txt documentation"),
ioctl numbers list is maintained by general kernel community nowadays
instead of contacting Michael directly as he's long stepped down from
kernel-related activity (his last LKML message was from 2003 [1] and
he's in CREDITS since the beginning of kernel's git history). Also,
patch (including one to update ioctl numbers list) submission now
follows process as described in
Documentation/process/submitting-patches.rst rather than sending
patches directly to Linus as in the distant past.

Update the docs to reflect that.

Link: https://lore.kernel.org/r/200305261446.h4QEkBVv023861@duracef.shout.net/ [1]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Cc: Lee Jones <lee@kernel.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>

 Documentation/userspace-api/ioctl/ioctl-number.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 7a1409ecc238eb..83e5d2abdad694 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -28,10 +28,10 @@ or number from the table below.  Because of the large number of drivers,
 many drivers share a partial letter with other drivers.
 
 If you are writing a driver for a new device and need a letter, pick an
-unused block with enough room for expansion: 32 to 256 ioctl commands.
-You can register the block by patching this file and submitting the
-patch to Linus Torvalds.  Or you can e-mail me at <mec@shout.net> and
-I'll register one for you.
+unused block with enough room for expansion: 32 to 256 ioctl commands
+should suffice. You can register the block by patching this file and
+submitting the patch through :doc:`usual patch submission process
+</process/submitting-patches>`.
 
 The second argument to _IO, _IOW, _IOR, or _IOWR is a sequence number
 to distinguish ioctls from each other.  The third argument to _IOW,

base-commit: c0fe189b590c754f69e0cb87c5b5674cad535cf6
-- 
An old man doll... just what I always wanted! - Clara

