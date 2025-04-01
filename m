Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F33C1E9B00
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743501774; cv=none; b=Vx4yWNgmdoItmuVrYB/iVzaXndkn99HSPDhQkwBgVOjVOm0/ZtOnZXPu62YjzYZPj1pK5yv1BWUv2Zj9NZffVp0ILuLDyOjNF1TIy4XDkpJYzWsZdsWh0rG3CYclFaLEgqO9lCEdccCul+PHZ3dYEkhwBhBU53WO5jeyqu+SW7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743501774; c=relaxed/simple;
	bh=S+7hhUZKaGzXZ5Vb5J0IkFiuEjwhAk0z0It+X1BlMcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c94o2pOoRkUaDiOsWxkjHG39m5pig1x8cA4bZHi3LcKz/eFVXN2mQopDh2pvCmO7+T3gTmBIq+S//ZEbYC+Utz1lfFVWKHIEMweO5PKds3BVKWb1FpKES4btARiwrfqqIbKbR69XM6UX1Myuw2cx5pFUfGHxbJEnTqOvz1vmpF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GM5knO0n; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GM5knO0n"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-227d6b530d8so96583925ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743501773; x=1744106573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd5IXp6Alm3J0K89bEX0kQvQEDTN0Qjl8kmVaD0oCvY=;
        b=GM5knO0nWyOyncn54+S5cnKbik3cNudyTOG7f/8fD9E177QEknPbziMccv7lhokwBb
         YIOUX50NshaXc42+QIiVl1j64GRKuUb2APyxWTcAW0kyBYlakxB3LTmtHsZdXKPPMaDp
         U7GhR5d02bk8sTxzaT43o82jAci6KSYTSqtqAnK909c9k5ijdqiu7lytbBghxDpa59lL
         ZQ15QtKQGCtcBof1QaTLV6wNAniYjKTNoDLAUTw9SuhsMFhfP/KuehX6dPLeOMwMnWpZ
         mQyHE9dB7fcQiCQKexNKNElQKXgWpfLwTfnC1J0cCSgn4RcqRNwHIZp1Ky8l1rvsH/Yo
         Z0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743501773; x=1744106573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd5IXp6Alm3J0K89bEX0kQvQEDTN0Qjl8kmVaD0oCvY=;
        b=GaUfAORucJdPj3vaZCi/hqyKRL7qSAp52Kl71j0BwvaATMkWMqrJES+GmFXvNt82m5
         QyOIM6spbZVHSNfaobju8uRLaLotHEqnbuyphVN9dQz54rt+7frKLrf44FjWygALnTio
         +18rC+//vR+0rMZWTCide/hiDTckPzIcVlmIKX/dC0y/sdI8TpIyDc66R+1HwyAvHSs3
         vVb3//u8SyPY3PFWCCSWW4JCwgBO3W/13gxwxcDs/wB4wt9OGCvMdQg84+aHhGfG11Bb
         lt9f7WpeRrvb3+ntcylVK93iylvSjFK+8yitEF8STMaN34gd+to37UOg+LNJy4NEVMAq
         K3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCU7cjhJkJvNsd8nZplrXAk7urzgnpue3/YhgN1OwAihbTDsaUP/DTqQ3fx7qVHELEKmoGoJNNhcyVkl4yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCkoWZle/FRn5Uzh4nW9vwvwJhWlO8fmWWfAftWuuNotT/Sur1
	5Dp0T6uMIeRcBspSi4WPX0bTaAy8kmQ+OYjb9VHcOdfQM5/wAub/
X-Gm-Gg: ASbGncukw7lOSjfPRjoP2gvTztyIwHmT3vlPJxgk1hNx1raF1bG2/KwOPgfWSZaVNm3
	Dlrr6072RsmGIFFGy1zOVQ1CTIl+FMhnt3+HxYyaqa43W6in1QLyp2i+elXV+DlO/mTbN3nIdKH
	j3ccu0IYdU6BRitey5pPuEhJB9ILKhQ9Itd5hoJbRmlCKOV8JjIOfpz/ITLqHBRyXJsj5YjTvts
	4anKNlcjYEQXeFS9tXec7F+1MbTLSwLCXQZTjPEU8Kg8nMhbyTQibMjJC1mKqM4kAu5JWPd0C9Z
	aBmpJxqb+u2k5C22K8k5lSu3uugy4t/drJxg69nxQV8iaxsCyNEoDTKN3P4cDI88hkMJ1riEAxg
	V/5HL7g==
X-Google-Smtp-Source: AGHT+IHfzKJCMxsQquxwIgBkGA4++Ea4IQ3SceFSFB7WeKJfY/LrgJPN1njTkSCir0N1ITkrL5lWCQ==
X-Received: by 2002:a17:90b:50c3:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-305606a4adamr4922602a91.0.1743501772570;
        Tue, 01 Apr 2025 03:02:52 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d3cdf9sm8856799a91.7.2025.04.01.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:02:52 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: krzk@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] uio: uio_fsl_elbc_gpcm: Add NULL check in the uio_fsl_elbc_gpcm_probe()
Date: Tue,  1 Apr 2025 18:02:40 +0800
Message-Id: <20250401100240.24439-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0b99b7e5-a035-4a15-8389-dcb3ca81f96d@kernel.org>
References: <0b99b7e5-a035-4a15-8389-dcb3ca81f96d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
uio_fsl_elbc_gpcm_probe() does not check for this case, which results in
a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue and ensuring
no resources are left allocated.

Fixes: d57801c45f53 ("uio: uio_fsl_elbc_gpcm: use device-managed allocators")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Remove printk after memory failure and add proper resource
cleanup.

 drivers/uio/uio_fsl_elbc_gpcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/uio/uio_fsl_elbc_gpcm.c b/drivers/uio/uio_fsl_elbc_gpcm.c
index 81454c3e2484..26be556d956c 100644
--- a/drivers/uio/uio_fsl_elbc_gpcm.c
+++ b/drivers/uio/uio_fsl_elbc_gpcm.c
@@ -384,6 +384,10 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 
 	/* set all UIO data */
 	info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
+	if (!info->mem[0].name) {
+		ret = -ENOMEM;
+		goto out_err3;
+	}
 	info->mem[0].addr = res.start;
 	info->mem[0].size = resource_size(&res);
 	info->mem[0].memtype = UIO_MEM_PHYS;
@@ -423,6 +427,7 @@ static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
 out_err2:
 	if (priv->shutdown)
 		priv->shutdown(info, true);
+out_err3:
 	iounmap(info->mem[0].internal_addr);
 	return ret;
 }
-- 
2.34.1

