Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952E2AE93
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738527839; cv=none; b=s2daTZLqOw3GCP+NrwY3Mbsv/xPivv+7Za6MxX/7Jy6dzJUJgBBuqv4oQyUmM3aZ+9r6MlIntp7F46FUFLjfxJ63XPaur6iYMB4oJSAJpJ4JB2C0HLWkFDCEmUnFFOWyqQf5Kt7qyFdt2Hbwp0CllOkmG9ilOzpeu1NlDQydodI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738527839; c=relaxed/simple;
	bh=9pKSNR9xLAVVswkI2sbO4Pa+9flfgZcRANj1mP29TjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDjfBrHtElDU15D7TKIfSxj7lDC8mXteNKtzxizYD0vg7HHdNqV+08svDYw3RH01VRNFXnpxCKGaA3vNFk3oiZ80YG6C/QnJFnBMOXatpA3yWz2lYdXWEQvt6AsjoPIVK8/iP+flKG4rLlvSSr+UNHrJLKtI9YCLkheIFkayTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkOZCCI/; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkOZCCI/"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46785fbb949so44586761cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738527837; x=1739132637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ve0jiWALpbIOPzwJNHzospSeSkSRV3agB0OzKYYrI8Q=;
        b=RkOZCCI/+JEceY6JWCNDvuTCbDrTmpJKveRBUoLubZRd1Kq2d88f1GpIuqsujVcA+E
         Ha1B4Xzh07SOeCgP+f34KPV1l7VXo+mN0g6UTbVpqJFAB2glAQ5fv9Q93kNZrnAS3LoK
         DgLByM7IEg3mrhqtIsoIhfqioFysC/CIkMhxLeGslAJlyaeF8JCTPWm03p3MLRbTxtuB
         jZ1eRtKlGtB0L5+n3I8zm7qYxbjMrBYbgJYK2XBt4wUCCHycwamX6EQ+5TWYIINsJ9BI
         uE2DtpZP4TfO/HbDNKICP9J3t0B0GEOZzLLJfTh9KnC4zLl/e6jrrd+eSfFBCYgtnLjI
         rp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738527837; x=1739132637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ve0jiWALpbIOPzwJNHzospSeSkSRV3agB0OzKYYrI8Q=;
        b=hROSJ5wPTrRJ9Wk63LBkX7LvyVuK6W9FbylOZNPufDuveO8ijFbUSbdIJz+n6Xz1Vq
         W3zZEWQGLwiS0pqmAL14ow8aFpO7RQ0BJmob252kOy6LhJC21Y+JXN0jKUhdMaGqA5LN
         UMacfKZTlINx5eLxxn/4dtFKy+D+HVTT5NIbjBntB3yfRu0FH89EFLj+nycV50WitCl4
         /aTc5rcTxnd57xCIRnTt8YHwCuiKEd68ZzJbYL5aczAgeU5SrgMQ2mWdGuSASQ/4/tQ8
         Yvi6JLfLL79+EfN2Yx/UU+ooJyzYqH1C3PXKwqISOs6oFKI+EwldQSuDzmcfoAyrER8u
         36Fw==
X-Gm-Message-State: AOJu0Yxglt8p5vT//i+0oWvPvCXL4o122VKugHpVsuonlKJaLquX4AYD
	3FuTqJ75oCTQux7TCET9qg4qwMIgio9jFHXbdT+77ZUFkYqUw7r4UJbM
X-Gm-Gg: ASbGncvNlC/b+PiLfGV86pmjguazEf4KyDs/Euo6SRjF/M2gGqSq/kcJ2PAbugK9+r/
	sBmlsBQoNOVG8yv9hTkMAzQjxvrijMp882zAEwwaw+fa3uN8Fc2wvzTRo6AJUP0LSsuOkFvOFMM
	vPO8NYsYA2H3SqibHsT0UzlX4z8t0A5kgAYfQqnDdG7r9gteDdM09QdiJEuWJa+wjNB/km4lBrK
	ZGmtxrdH3MHSW4dRrlCkPe2Em3SAUBRUM4dApmktWNxriA5knTnzToZTdkuRnQIjCVQK7lo
X-Google-Smtp-Source: AGHT+IErm9/6Nd0hxazswGWz9jR7ZM+H/mkNEAg2XeuZAHpbcWE686AUODiM5Kwk1Nml+xNCbzxZgA==
X-Received: by 2002:ac8:7d13:0:b0:467:677a:74d with SMTP id d75a77b69052e-46fd0acc386mr230173271cf.25.1738527836817;
        Sun, 02 Feb 2025 12:23:56 -0800 (PST)
Received: from citadel.lan ([2600:6c4a:4d3f:6d5c::1019])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0a74dcsm40800871cf.3.2025.02.02.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:23:55 -0800 (PST)
From: Brian Gerst <brgerst@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>
Subject: [PATCH 2/2] x86/arch_prctl/64: Clean up ARCH_MAP_VDSO_32
Date: Sun,  2 Feb 2025 15:23:23 -0500
Message-ID: <20250202202323.422113-3-brgerst@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202202323.422113-1-brgerst@gmail.com>
References: <20250202202323.422113-1-brgerst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

process_64.c is not built on native 32-bit, so CONFIG_X86_32 will never
be set.

Signed-off-by: Brian Gerst <brgerst@gmail.com>
---
 arch/x86/kernel/process_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index e067c61b5fca..4ca73ddfb30b 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -942,7 +942,7 @@ long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2)
 	case ARCH_MAP_VDSO_X32:
 		return prctl_map_vdso(&vdso_image_x32, arg2);
 # endif
-# if defined CONFIG_X86_32 || defined CONFIG_IA32_EMULATION
+# ifdef CONFIG_IA32_EMULATION
 	case ARCH_MAP_VDSO_32:
 		return prctl_map_vdso(&vdso_image_32, arg2);
 # endif
-- 
2.48.1

