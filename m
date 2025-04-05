Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2553FC3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844403; cv=none; b=ZEqJ97q8GnJbZvlyK/5k0BHccONfY4m1h7Yssl4PRMZHGGTaI+7LcSCr1WwM7re+1Firh5tlzUAiOKLdqlRpNvikZ66a7ADU8ALrQCEa+qUPQr3+boe8BubuhklvmSIlFV0jLpz7uUsZ2rkJvvcsyVu6VXlrGXGfwVR+LVX00hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844403; c=relaxed/simple;
	bh=pfEubIKNeeFOnL5gyDmaebVebKzbDrXCOVJJAbB4UVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etvxqeJFAs4i9JiaQ7YFsEaXX2UWuotGaixWq5lwBPfgl4YoQO1X1gTLpPKtOaQTFfWiJry58CfIbu8//fye2SicLj05yXtdQ2ecm1i0mTqCSXUarMU8jpoVUjVF7g0DVjjXX+COfuvPx7eqDxVpSPYRJbeHL4Mmaq99TZ4S7rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRIZf88D; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRIZf88D"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so26810345e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743844400; x=1744449200; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6ZR9eFKjGpMS/icjDm1o4uzi+JHmRFmvVzNAUIZTO0=;
        b=KRIZf88D+o/FZRCoe2S8mY/b6SR8p4IpxmgZ0d4DWMH04oH1WUYx8dsQAVN4osNNbc
         L39xVveJOqd6V6LiKmXe2wsKIJR8a5R70CvfolMVaHPYCcOuJq5MZ2T4yyN5MOKTiiCH
         lsP64Ul8Jx/3PEZli13+eG5Li8FJT/hreC/Y3Djc7YR17ALpetcxZQ115X4hsKc6c7ie
         kNsniKdNRb9f5N1PWrVmF3ssYYUPOEfanQJJuNxa/pqJxgTctxAONG8UaCG2rWcpVPfN
         I2Je3ZTDPBKCsXY/DwUUH3+gPU8Rhzwyx9/4j9AVWQ/gy8CwqZVZ+7G1WHW3flpDAzuK
         er2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743844400; x=1744449200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6ZR9eFKjGpMS/icjDm1o4uzi+JHmRFmvVzNAUIZTO0=;
        b=fKJCJ4HQyk9mZKZmjRCESGH3BjOeLB9wqyW+QcyHn6MKU+y5YB7vI7UWdiBtRGk4Yp
         vhq0A2tyupVQB02e8p3LGdrWnVBJD0NH7hgxC9RWM7F7xn8ZWh1W8FIyNA7eueVgQUNR
         GywWMUyKcQ3ZSvsBWhzo8X3EYxu8r4qN6PT5GKn8uVP1rOQXma03tkV1Xxp2+vv55YE6
         +qoqBmKxCc7FON1gKrj5cidUeG8kx6+KRDA0PRI9v7wALJFSsOicuMqrzYNq+cta0eRl
         fVjyyDrEHJLqoVBlZxxpARRKMhLC/vkNg3jOjgbiNsWNnyXrUcTAB5+pAZK0o06clEVB
         Frkg==
X-Forwarded-Encrypted: i=1; AJvYcCXk66E3e8R/d33fd3tLatavKb2g3j93MoWZi6akOdAmMYK8ff8NSdlkSEzGrRTPFz5ahiZZXzRv0fVmzus=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKE3QLA0BdAujnZ4cWavVnXP9L4ZAkXk9BDW4raL8r7OKYweu
	9/JRQwjgBgINI82phzSpoqYt2SmNFt5RspUFblt2pYmCn70d1H+a
X-Gm-Gg: ASbGncv8CMnSqEbxZpbFyonOmWvDwcD4ret0XS6IwmUtOV6hnoUvYQ2oWo/9qr8XLP5
	E8iSbK8+JLq3UJLtM8J0M9jNj8Cg5P55XWi3/lGM2CxVvEgWc/UCPNUF5lZ5DbMZW//tGGbuuxz
	BRM71cNU1kxOM1VC3Q6aV45VkliWyPmSw8E8MWeOBxl+WnUhLz1zsamuIuBdQ0bPa096EvzaX1v
	VnkuCjYy4Khy1zZRTbUNGWvb7v0Tu6o/tEbT8mhTnqXjvrhFPCEJ7AFUuPTrtAtxFROR0hjpbDE
	dXrpyrr+M2ha2chtv50k6d4azwXn8oHn1LqTS02qKsdgntMzPUZPBC2tLoQEp2SzkwrABkcDU86
	7RyK3xoY=
X-Google-Smtp-Source: AGHT+IGfzl2pv5IsDRt5SKn785/yDIiUNWg/VF2UgOdPy4T5iI2Zl3GW3bzzP63OL0/FBxHZiPw/Lw==
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr4865881f8f.26.1743844399679;
        Sat, 05 Apr 2025 02:13:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d980sm6444591f8f.61.2025.04.05.02.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:13:19 -0700 (PDT)
Date: Sat, 5 Apr 2025 10:13:18 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall
 <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Dan Carpenter
 <dan.carpenter@linaro.org>, "andy."@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <20250405101318.3fce2dd5@pumpkin>
In-Reply-To: <Z/Bro47isE8zhcu7@ubuntu>
References: <Z/Bro47isE8zhcu7@ubuntu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 4 Apr 2025 23:33:16 +0000
Abraham Samuel Adekunle <abrahamadekunle50@gmail.com> wrote:

> Replace the bitwise AND operator `&` with a modulo
> operator `%` and decimal number to make the upper limit visible
> and clear what the semantic of it is.

Use 4096u to make absolutely certain an unsigned module is used.

	David

> 
> Also add white spaces around binary operators for improved
> readabiity and adherence to Linux kernel coding style.
> 
> Suggested-by Andy Shevchenko <andy.shevchenko@gmail.com>
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 297c93d65315..630669193be4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  
>  			if (psta) {
>  				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096;
>  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
>  
>  				SetSeqNum(hdr, pattrib->seqnum);
> @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
>  						pattrib->ampdu_en = false;/* AGG BK */
>  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096;
>  
>  						pattrib->ampdu_en = true;/* AGG EN */
>  					} else {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096;
>  						pattrib->ampdu_en = true;/* AGG EN */
>  					}
>  				}

