Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A970825FA04;
	Tue,  8 Apr 2025 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104804; cv=none; b=ibSUOOUnMRI6sev8y0N07SyCVRxevd0FJO56VSpWYpS2BwNcMHNZYPTOCFb/OX+w/uuSLMtGrKQ1QDvAEtjAFRdgOQv0JA1FP4nefnwLF9ibClaWjgZhQIpBFaVxXa5HFQ4suYAoYJ/pEMEXD8TjRahMausMTugB77P3QWn+V/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104804; c=relaxed/simple;
	bh=380mMZGsW2w+OgssflwNeYDmZyu212sTwAYryOrAOVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rY/69wb7rKg/ZC0IFnUSAaFP0EFwPMgn+d6gbHYhu8OPG7ExVvQ+HNjxswzot6JhwNsWOciCiS7FVt9eWwCm1TPPNFmzQFI4+VsS79IAAPKKoI8xrDjdhRIyQwBYY9Q2qTwzBjKN2GbTfE8FcYQoUZ8mguXnUnOLF04jkVpj960=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMyBRgND; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMyBRgND"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso717625966b.1;
        Tue, 08 Apr 2025 02:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744104801; x=1744709601; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MU/Lb/1w/rHKsFuc9Ox3Kn8a905i0mooFwtMAQiNnDM=;
        b=nMyBRgNDCL1wCac9VXJdCsnfz3GHZVqQgM9Rxm5QqgYslQbZp6qWEnBvhxbWexGh6t
         LJXYEYKcBCBlhYSpxOFr3GCY5MxgZJI5sEF+/hJ18QEZu9ClxHrJ37kj5kBF6zkSmuFY
         vAqUtiSiblVpRYRbVpRQLU1rQO3DjtLMKDMH/zFjLSS9wsdUgbCVCNTZuOk766xf8/jP
         Hojc9nVLGZDI/22g2w7MFvjwC7edUVf1WHLP/2CNw9y/T0ChcTV3RwuRHDQaf8GP+Cup
         H4lkp4UB9ohzvk5P8qFCZz9bWpuZzZSWhDnJ0fB5+V4VO+HaEoIybOkQPelvg3q3iGlH
         oOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104801; x=1744709601;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MU/Lb/1w/rHKsFuc9Ox3Kn8a905i0mooFwtMAQiNnDM=;
        b=FNybgHPlq28qopk89aDHDykxPgAo5Q+qqXd0g+Tybzt6aDg1B6682MNMc4iYJiELWc
         5NNUmJw8+b7t3+TaIbdjb1cTqhnCq26iwNZNCXXCQB3M+nxzPMOPIOlNoVf9gRHpcNG8
         lxmXDyp0MU+tpHNoHpD6qMKoTiMv5LqdU25WTQBTqVMfePbQ4aQ7tQbK6210n7s0acsY
         Vi2b+XN6Qjvb7sHLxhs0J4YuqyGmtEbKSgSJIXJlukM+x4nQsPLMmFqzZtMsYVtJdUoZ
         KTLNz9eOGUJrvkr4hchSGzJ5ZqlAHhaxlZO5Wy1YV61GoHAXPDq6hH2MHPKYwh8QnD6f
         ktIw==
X-Forwarded-Encrypted: i=1; AJvYcCVoOijlhuslNcKd87Lr/I+Vmuzxx3d+KD3pBabXQKlQtK2XMw7p5Z8zObx8Tdf56fgWIvOi7GmfIXuS5g==@vger.kernel.org, AJvYcCWXTEgB0xyjCxC/rZjmPX5bxKt+vfYg97nsDFkn6E9Z0JqIZay8uZ4w4Y3omeLYqKNVgjO8g4+Qpf3oK/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Dz80acZHZ4TRtS8sS/yu3wIs/6RvF+O9fyV39N/xBZAjhdAL
	AdHrR4yBdNCEVoX3b7PbACzxFWlfKZTOp5z48YFR4jb72DD2EFuDajCSM5oM
X-Gm-Gg: ASbGnctvZiAAVw1l2PxYP1UoLDhv6hPq/9LRhaJevmm2O36ILh67uJZTmO1oef9FVNz
	ymMWRPLPLHz6ULYurjeM0dSMG8yab/NxKDPeK5cSZwuKOvz/ll5bRuiTKihBC62nLbYRFAXhrud
	GUJPVXfb0dlQp9Kmm6ZXeUrzUGC2G3T073dLs0XhI5rn9Gj0NUono5bZV21A5FxvTIJ/fNg323j
	HUSsqNISHLS847f4Df7c8n/WYmv0o8esxsTCJxBoJPPfVK6joWA3XG146kG7aQXlW8yU1K1CYF6
	HGQc0s/QpRVMrDZ62qyidgFgwySgUUq8dV4pB1VPPw==
X-Google-Smtp-Source: AGHT+IE0KYYx7bE/EVmjlRl3D2LqDqHhYsu+wBqvqMzldnaAZvuJXr5HkgzH7KqKnJ5lSYJP1ouIEg==
X-Received: by 2002:a17:907:db11:b0:ac7:d7f3:86c6 with SMTP id a640c23a62f3a-ac7d7f38826mr1174819866b.9.1744104800590;
        Tue, 08 Apr 2025 02:33:20 -0700 (PDT)
Received: from pampelmuse ([2a02:810d:a1:6000:959d:6b59:1561:d2b4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9be51sm894916566b.50.2025.04.08.02.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:33:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:33:17 +0200
From: Gon Solo <gonsolo@gmail.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ricardo Ribalda <ribalda@chromium.org>, linux-spdx@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <Z_TtXaRnaU1zXbXv@pampelmuse>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <12647854.O9o76ZdvQC@radijator>
 <Z_Tgp8L_8goc63K1@pampelmuse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_Tgp8L_8goc63K1@pampelmuse>

> > checkpatch suddenly broke for me with the same error as shown here and the 
> > patch fixed it.
> > 
> > Tested-by: Duje Mihanović <duje.mihanovic@skole.hr>

Turns out, it was not enough; the variable is used later.
How about the following patch?

From 763f25c8ca2e29f343bfd109a17501de71b38d43 Mon Sep 17 00:00:00 2001
From: Andreas Wendleder <gonsolo@gmail.com>
Date: Tue, 8 Apr 2025 11:21:17 +0200
Subject: [PATCH] Fix spdxcheck.py.

As explained in Ricardo Ribalda's patch:

If the git.Repo object's scope extends to the Python interpreter's
shutdown phase, its destructor may fail due to the interpreter's state.

Exception ignored in: <function Git.AutoInterrupt.__del__ at 0x76e6b0148040>
Traceback (most recent call last):
  File "/usr/lib/python3.13/site-packages/git/cmd.py", line 790, in __del__
  File "/usr/lib/python3.13/site-packages/git/cmd.py", line 781, in _terminate
  File "/usr/lib/python3.13/subprocess.py", line 2227, in terminate
ImportError: sys.meta_path is None, Python is likely shutting down

Unfortunately, repo is used later at line 392 and 399, so we have to
keep it and manually delete it before exiting. This can be checked by
testing a directory instead of a file.

Signed-off--by: Andreas Wendleder <gonsolo@gmail.com>
---
 scripts/spdxcheck.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
index 8d608f61bf37..6a89e2b2faba 100755
--- a/scripts/spdxcheck.py
+++ b/scripts/spdxcheck.py
@@ -448,6 +448,7 @@ if __name__ == '__main__':
                     for f in sorted(di.files):
                         sys.stderr.write('    %s\n' %f)
 
+            del repo
             sys.exit(0)
 
     except Exception as ex:
-- 
2.49.0

