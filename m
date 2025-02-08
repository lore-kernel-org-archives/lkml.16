Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ED914D2A0
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002596; cv=none; b=jBwbUGiZ8SfR7NAjS1mPpC1yi5rraL/bBcbgCaVJcRC6/sFXHsXj4TLks+/IcCoXK60eRB5y52fX9mogKw34RPLX6thqVUJwxHSYWPyKPzfw+TJJUzVIhMYGf5/J+jNmdC2EWCLAcT0brQXT/5lxBjC9BXKiW2XliiJa7LEE4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002596; c=relaxed/simple;
	bh=YmsF3FA9wQc6E333xr0Xx4xLIsDEX8jsyRvV/iqNYnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SgUI/U5L+lRGgQjPR7jRxk3sG3rKnM4xEv2Jv3Au0ERdHS0sYO/HDnZGQYDXVc8sn8dIOLDj6z0bOeRRYEBsqrD/DlmYTgiAw0RTYa6HqrCIGdqu7BX0I6S5ZiCzg5NA/LW8ZmBdp0sAu6abuZRwaNqWdNaIRzwpgGg9nUAXTMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObQWB02r; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObQWB02r"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-724a5d042c0so1676654a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002594; x=1739607394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tXoG7XaqENK2zN10Ebh6bFl5WkX7laHfMpPE30E2n0U=;
        b=ObQWB02rPhNPcgzb5O2B26IUEOrAm+N3eUVk+jDdy90nlnq8iXXyyrvBPc2HvRRk0i
         k8QaqBCvn7IpytH6der1dGL2mEtN4eFXFU8nHAj8TKHnjWj0sMRaR9vHidlmGuJKP3AN
         BPk/5rgOgF8j9G7FnDhXNKIo4RCZq8x6DzX7IXdTft3PQ41Et6W5pUXa6ghWkTCD+h9G
         KxLaVAd1If0hqaxtEFa3461htai3WtoYC8nahlT2NBswGC0bkf/3PdyFDma8H/dl80V2
         gR/I6sSVX/itAgwg4FkLcXdzYwJ/+uHJOzlfS8LKNkiIxjmpPEObuXW8ysoLzH3DDT/1
         stgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002594; x=1739607394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXoG7XaqENK2zN10Ebh6bFl5WkX7laHfMpPE30E2n0U=;
        b=R1oVHtagcMMqlOGEGKPp4t2iZyunlmqGEFhQigXph2LAHS+aWY/unJfGQuSOt9sOux
         gyvOnoKyM8CZEeQfP0sEF3uwCAr9q/Fd+U56xKZVUqBGzoyi9SzHIHUe3ZlYLzAfaxc9
         MINzizMGCAFI/DDPh4HdZ+st1X5zC5I2WxjWZHPW43Y2CMzo95hsCn58dj8YNTmkGfOx
         uEwr+21+N3tXD9zw1KfjEEuOSqAtUBfmF0dER3pRAvg5L6uNLg6HbF2cp4sObwHrsVxP
         F+LAhcl89EBHB2MBzJebpXFCYbTWvT8l2TfAa9f7JAtLsBbblvvzNmjrGS6g0rc2VL1d
         MZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv431Hf3AJz+WMtlUnLjArFC3bg65VsLtu1N3JtEuiTL8mnzPnnSgTDlCXbkwwb42NIyjbU+40uvYwxqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz39jUCKKwTSSByInp5/EBbm0bgXqngcih1FwKgNADVi+08o/Bl
	v3OEIEiB16HwijNRy93kcp+sGTPrFGQ+vyxh3z386jN9RcagurVN
X-Gm-Gg: ASbGncsZN43qPBXIvOTI77fud8+5COsRmrc2DcDhhLJ9LUWCAebCwtwOwq0atFmcASc
	6jh4E9DXjtj9P99UufejGBtyixNuGLOu8S5Pzv5Uk1RSFfAPzsPk+mz/GKukn4HKAg9jiXPquOE
	xV1O13GX1ooXFUJkG10xXMVXJrFKzhdlISSI3rzJGHCnVgET+0nOxE/7bcAvGh2zokCd0Q6U4Tf
	/KQlX3UCO/SUbyhYb9hZDzoh+gloiZJ0I9X7ksTYhVLSB+i6CNaWCiN9KguFG+9SK0v9JQHFk1N
	vfZ9qIi2zJf9F9kyOdhXSlUCyZwayB1BYJlC4lsCCOBC3X03O4uP3hUdvAZoDbUaSZGqXxTKEQT
	E
X-Google-Smtp-Source: AGHT+IFbqyEXqJ2M84FBVS3QUAXmHze7vLJBVil8Ilsyy2KXeJgbsvrw3VvXCLh3Mc96pEZOtgwSSg==
X-Received: by 2002:a05:6830:6f06:b0:718:f57:11ea with SMTP id 46e09a7af769-726b87a4e60mr4190310a34.3.1739002594131;
        Sat, 08 Feb 2025 00:16:34 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af914457sm1290441a34.2.2025.02.08.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:16:33 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 0/3] Adhere to coding style
Date: Sat,  8 Feb 2025 00:15:53 -0800
Message-ID: <cover.1739001527.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=358; i=onlyian4981@gmail.com;
 h=from:subject:message-id; bh=YmsF3FA9wQc6E333xr0Xx4xLIsDEX8jsyRvV/iqNYnA=;
 b=owEBbQKS/ZANAwAIAepTOeN7sYcPAcsmYgBnpxK4bCgoP4OUciUh7UqkIorYsKZA0CKdDTud8
 8Oza3RNvjaJAjMEAAEIAB0WIQRWEQChjkHIk0vVfn3qUznje7GHDwUCZ6cSuAAKCRDqUznje7GH
 D3hJEACu7z2e/IU8awuvIUCVfDU6WIL2IVe9fjVtoj2oDWOJF1FYHefm/kf+bPUJxioAAy2WW21
 pJr74WJ42QGHukBv0wti6iupJLK78mPpK4HWWk4HuQ+BikLiTjRXLPBNJt26FRNRsM/h/BfAbFF
 3dlZ8ZEfrN85kpyXLfLr2Pz7p8DNZ6yhoAD6+ZOhcJzVOv3x0x02t55JLJrnP6LeLCWOWQXs9Qx
 cOzQc4/eW+mBthmzYfqwhJnT5mohXG+GIZcBjDnTxgX/e82IEz82FgUIXK4qNZq+BphKm/zG85g
 0v1s6dG/5NnYqwtUmHC5vczYSHVuqp+Fcna8AB1JHjsPRaaW6LXpyzX3C4nye9Nzm3onr7R5tWB
 wm2O+gfgvsQKVSM18oZWRmvMlw7iTtwf5BKKO3cSUcvN7GFMPG7EXpfphLmgpJDrxKaA++vJ6+t
 a/if1h+T139VbtcZqatbRk82DIpCOAQcOY9MM0/+JOYxSZfNscwad8MuYRv9sGAB1DGoLPsWR0j
 dvL+NmhZnRyBYxqiG9fLh1IdKsjt8KZczmFp4DILgg0bSUKcpc/TdpXxFWB8gJJBxPyIVihX54Z
 c713mcYllK48tZ4zo+zP2zXOiT9q0HiQevvjWwQNL6Srhxv2N7TLeQ1OaMrI/64aPVRDQvjQbyB L5JrErLtnC+Z+wA==
X-Developer-Key: i=onlyian4981@gmail.com; a=openpgp; fpr=561100A18E41C8934BD57E7DEA5339E37BB1870F
Content-Transfer-Encoding: 8bit

Edit the file to adhere to the kernel coding style. Reported by
checkpatch.

Ian To (3):
  staging: rtl8723bs: format comments
  stagin: rtl8723bs: fix spacing
  staging: rtl8723bs: remove extra blank lines

 drivers/staging/rtl8723bs/core/rtw_security.c | 279 +++++++++---------
 1 file changed, 133 insertions(+), 146 deletions(-)

-- 
2.45.3

