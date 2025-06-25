Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352DA261399
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869291; cv=none; b=pns9Jwh2nAu1+52xwJ9DdyPSQUOO3MsPJEvKVcVFbVY3fJs2BILVknSs52Hn167UP/ejjgxMCbdtE5qSdqY9UApUgvY93rs9J6KeJhXPVepyD3vYOfo9+WTYDQP0NKvB5eIxyXDGBhaJYEy60RVmjfvAZi5anYs0DeDnhfzuzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869291; c=relaxed/simple;
	bh=+6wqgxxR7Me71qslHpVudiYavpXQSp6ulRA4pb2XVxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P6+0piLf1szhgyPPl31lJHCLs5R4T2Zae484CKtEBL4rFFq0rGlRAQMVLlGT10zhsA4M7IazSy0PDEeizutpBl//+8PvKJSx5oHai01C6GUMUbwv0sFbb5+2rPfHzH2CKt35rxHQ6916MHwbvdEtSXBB64/CiiKUzdFoBxIJW7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6QbEofM; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6QbEofM"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40a6692b75cso87421b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750869287; x=1751474087; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrg5o6ZWqHe6BVlqH+ZmBJL3aCRbP2lK8tfCGzb7q8Y=;
        b=F6QbEofMRVDnyk2LBARQTsljqJjMHBJKnGa40RaB1F5wyCfw45vKMCPxtlFqly40dq
         OvRRlxZQieZj45OVU0OPdtXl4rfjWRG+NfGmHJNTXKjDFpXU2Jxz8OwENumSo5JrsZGm
         7x0B9efNrVOjDtjRRbJ6uLQDRrI/H1V+sCTIt341SKrNrQSa5ORGbGtunCxfQ09rTy6R
         Q/TjI5YPd/ELx+f5rOef4eOHvp2/gvi006lYQqVbAMPgkwt1MROHTxGDvAEwzNp5VudV
         cHZhylbp3ZkXYS1ALaTGb9AoM9547EeBFOY5TRY8tJ9dRucTAwV1IVwrZhu+wCFrhT2d
         sm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869287; x=1751474087;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrg5o6ZWqHe6BVlqH+ZmBJL3aCRbP2lK8tfCGzb7q8Y=;
        b=o3gSuywOOYwJ0SIrEB8M2Q8EtD7yJbesnvcQxb4NTxQJL6l9c6mxzRPRBzHKBY6ROu
         gAPjWz5eBjRyGDcTxvriluZTFn30G11St/m3bj6ueFF3UaDYwWvu5EOumI71D9+9XkBG
         CxjdBA/j+6qshJSvWaETaqk8xwBPUq0nwyODOrvuTkkJCnfeGhAN0RGaeii3spwyPqHu
         gHCk/T3alMhMaIl+yQ6inl8sWhdhKC1xIks8G7fwm+vQO4TuI65AxgBtEggBU2bRCdsw
         ZNvmUpyMrgbDCxtnzfJYo3t9ltBD9KyV52A5G9qWOKc+saPPkDCJacZM790cycp2w0JE
         dU1g==
X-Forwarded-Encrypted: i=1; AJvYcCXSyWfezEsjo+CvpyMXVND5gPWIEpbYSqY41xJW3aOCwqYh/JkAe0/iySFD8NFjmMIpA55S0R7uImfUHlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkMuoV9V+0j5zssMc9TwLb8JgSZglJAJbn0wvw35OYerlNUtFX
	5zOJiT06mHqC9XjS+Rxc9nNrhymWpRLiYnPfvVEZsHkiCXsuB0Jee3BGzV8YXe+6FrE=
X-Gm-Gg: ASbGnctvfIfu4wz+9VcfZ0Y3nDxvaUog6sIJPEt+8MhR3f3HcI9cVlFYrVspYC9zow8
	hc6hyeY47tMgrr1XYI3jf8xuI8ALio2vH3DLrQNgNnvVMrvpw76a8NcCaNWzHp05iLUuBKmNdmo
	Z64oie8ViWaYiI5XPgy5Ey50cLAsjy8ddHU6w6nEDoN4yB/wg4NFnCgeS7voa/uPsZC83j9QG3Q
	ZFg8/pmkFq94Uph+g7TNw6fEbfcQKExN3Aocw9VKqgiOf6okIhTeG3hyKj3pw52AJDudkWJ1gxw
	GT/v/Ks8u6QKhFoClpsIZP7Ch0wl0vAnZszCFwuHQ6S6ylEz9Uyl3H6rvqZcV8qKFgEzsWdxgyv
	CQPIW
X-Google-Smtp-Source: AGHT+IFVf2/OzoPY+jIiHiAS31rkntvWB5bTPdOgIz/Ycy0xkSwP2Hh43icKnrjelMBdDXYuYTI8ww==
X-Received: by 2002:a05:6808:1898:b0:40a:a417:b62e with SMTP id 5614622812f47-40b05bf6ea8mr3342994b6e.21.1750869287243;
        Wed, 25 Jun 2025 09:34:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d11be3sm2283728b6e.37.2025.06.25.09.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:34:46 -0700 (PDT)
Date: Wed, 25 Jun 2025 11:34:38 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <c71e7ba6-f127-4f49-acbf-20063dd26553@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "einj_buf" buffer is 32 chars.  Verify that "count" is not too large
for that.  Also leave the last character as a NUL terminator to ensure
the string is properly terminated.

Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: I messed up the sizeof() calculation in the copy_from_user() and I put
    the parentheses in the wrong place in v1.

 drivers/acpi/apei/einj-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index d6d7e36e3647..2206cbbdccfa 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -826,8 +826,11 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
 	int rc;
 	u64 val;
 
+	if (count > sizeof(einj_buf))
+		return -EINVAL;
+
 	memset(einj_buf, 0, sizeof(einj_buf));
-	if (copy_from_user(einj_buf, buf, count))
+	if (copy_from_user(einj_buf, buf, min(count, sizeof(einj_buf) - 1)))
 		return -EFAULT;
 
 	if (strncmp(einj_buf, "V2_", 3) == 0) {
-- 
2.47.2

