Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474C926AAB5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965284; cv=none; b=hr1T//j4iq+VG9O9Z4DGEWmI0NIA/arIxwzHo/lL3g/ViAiOiMBaweQrsFT18PU8V12kgj6RfnmVc32XVRbuCZ9zf3TSgG+M3ckiBpBJ6jG2QKXxu8De1RwZIanx09YONY3XSaKuE4iemL4NXcvQW1NyVTCSHJPAj/Uha1Kbxfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965284; c=relaxed/simple;
	bh=VLR/k9xg42S1BhTW2qxD5JbQfIGxqEsRa+IBpaV0BDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8MyZoDSzFe0GwybBwC4jO/lqXqWDcXLVrm1Q6BOBku7kchl9OfH4d0C/pvFrQBd6797WjesUmrec7kgX20bOVUTC0XmEqgD8x1+ScfXpl9Biz6Zc1mk2wqP+YTkVcLMZfVWyvwRxFzVMi7hqWR6sr1L01J/9pM8UUI/HJVWGeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTcV9nlY; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTcV9nlY"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e61d91a087so2557760a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744965280; x=1745570080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwc4mfYSXYiH4MmePOdLJBQ3MQuMPTvYksMJAz49SvQ=;
        b=nTcV9nlY39B8e1atzZicTgIoD1rJyCT2EfI/x5+RVWf+oAuSXBEau4UOrob4jcFNRE
         nFyRWXpkFhbW4LAWejstBKGPnxeAA7N46gv63wSrEnkDf9KwzyoOSuqx+JJJXSPvmOMU
         iblHPRRn2Zl3TFpHs2eOvWBMEZSJb4amZnQCYzoOMJ1ZTutLDu4WaV9T5WHiuWQ3KRAM
         POvsQiKgusw0TisHqtSlHiD98o6E8g7IscAc/OP8i730Jsq+n0y1dZXQH2mulIvVM3sU
         p0yVqDxS6TMSXsoZgMEts0484wO5CtVB1/PH6Ach9hxn3jV1lamYQDhDsSUXEw7QHtMa
         bAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965280; x=1745570080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwc4mfYSXYiH4MmePOdLJBQ3MQuMPTvYksMJAz49SvQ=;
        b=R5n/ojbLJ1iyvSQNo3Dz+E9O2fA65DpoUDUh/gnwmX+ima6vo+v81jk5Kx5hovHzaI
         Wi78KSkp8sL5CUQ392swfadJ8SQqZrdIYI/h+ZmoNJlVlm7tWm4l37+x5BKyUus0mHEv
         yafIN5/mXVkYRl0LOTEXyP46oz428qqfVmY2NpO0BSuMQsW4VRNbTFY1y/G4+D5Pnrk/
         2uP0+0vfUTFJCo7HW8j2GFFOlxDwiosui65+Jakql+wImFFSoBf1gZFW7mBHqhLNupDV
         QV53E+S8EJQ/JktbPJdTt3KjKGqV7KFX43ie5q85XBZwG+wAym5DN01ZhRL7rQ5R+ndD
         JHJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSaAm9rLwMBhZJ3yvV0BBhTkm8kcS6O+vlLGOQri8fnLH4JlgCR/b0cHvgKGHsj8awepEEyAxCXHbHeIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeI748dSAZd1ITGozwutuqxt3fmt0xOi3JHYRi13cogCpAThCa
	iMgagLs8vzJJVB4R+rd+1mF8bjeQZgwzr7uOzXlGoaBDiXLDjlW+
X-Gm-Gg: ASbGnctCPWlJNNc9Qr0cZzNm3PqVxIlz8OYsbewF5oYxoPsw4u2Wyt5tvS5GNXSLjI7
	Nwc+cdO7YDwQv0kVAbe6zGIJOkuP1t0sOg/U1FspHnkPBbQv3IfqGNg62NJJZp2+pHOUPjZsC8F
	7X+EK2eiyCNs1O51yUCXlPzXBB6IWRPuUAag5P5GP67lSHj0VvzOZZVNVPBZQn4+k/HTjyFnLOX
	fM/UQreaUs5DHTpcTGi+czrKy8DynIzQjnge3l9zBXQXa6yzJH84LpPRJvP3KqoRmSClBC8e2nK
	6C0eyjiITUYdl60RsYT9B6w0oN9rZdCe
X-Google-Smtp-Source: AGHT+IEA48lUG8wBLPhPExAjeHlOBbEVqFiNpA99DqGcRwnr+5seRmJHWexkbH0GJZj2p8x907eLbQ==
X-Received: by 2002:a05:6402:84d:b0:5f4:d4a7:dab1 with SMTP id 4fb4d7f45d1cf-5f62854cb97mr1415586a12.18.1744965280426;
        Fri, 18 Apr 2025 01:34:40 -0700 (PDT)
Received: from fedora.. ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625833ef1sm720914a12.51.2025.04.18.01.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:34:39 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 2/2] um/asm: Replace "REP; NOP" with PAUSE mnemonic
Date: Fri, 18 Apr 2025 10:33:59 +0200
Message-ID: <20250418083436.133148-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418083436.133148-1-ubizjak@gmail.com>
References: <20250418083436.133148-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current minimum required version of binutils is 2.25,
which supports PAUSE instruction mnemonic.

Replace "REP; NOP" with this proper mnemonic.

No functional change intended.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: David Laight <david.laight.linux@gmail.com>
---
v2: Rename rep_nop() to native_pause() first.
---
 arch/x86/um/asm/processor.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/um/asm/processor.h b/arch/x86/um/asm/processor.h
index d50549e0089c..e222d2ae28fd 100644
--- a/arch/x86/um/asm/processor.h
+++ b/arch/x86/um/asm/processor.h
@@ -21,10 +21,10 @@
 
 #include <asm/user.h>
 
-/* REP NOP (PAUSE) is a good thing to insert into busy-wait loops. */
+/* PAUSE is a good thing to insert into busy-wait loops. */
 static __always_inline void native_pause(void)
 {
-	__asm__ __volatile__("rep;nop": : :"memory");
+	__asm__ __volatile__("pause": : :"memory");
 }
 
 static __always_inline void cpu_relax(void)
-- 
2.49.0

