Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDDB85947
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738311757; cv=none; b=AldvQTcdLP8BTTVi3nYkEQ5ja3QIVydZpIGDfWgz7YUNUD5X6ZZbSk6ZC1+hIV9jXHXo9WZHlVUJ8XRaJOEsQIpRaz4X4fhXgI49TQZv8NkIbryngaOs3rji5i0AlJWHuuqRInfj0HDEnUtArcOh5kMe3rYk/47RUsfsvZwnejY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738311757; c=relaxed/simple;
	bh=PaQ368fVPMewttIZp9E7uzLfeYFRCOr3sNNw4fdTGx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/afOt4mh0+pTPbI0oiAIHv8fOzwiyeP00Kbzo9UlWM7DF4Mfpbo1OVP1FiNPuKgWAbCGt6Yi2LP01z3iuz90ntp1fO64sXGkhmfg2w8/DoePGvJCN8hNIbKSK3tY/UBczhV8TqrN9YIdO6AwUB75/7ivuHpd/zambZeLpUsZ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGfFQwEI; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGfFQwEI"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so2937295a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738311755; x=1738916555; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PVysL2IB+DfURM1n+fDW+H+cpBepoWOEUh2zNKxVGc0=;
        b=ZGfFQwEIdLpW07u8uNstxWPAj24dD1PkQ0yQ6KoyB+bVypGq4gRgiv3k49geS19Rws
         3XvoXIP+vp61o6+q/o89B/65JGcooLZkWyaZjAygdvd+yvLrK5DL/x6hnqIQLUdK/t8c
         /OOL5lBdA+w+yLD4xAUzDWCfLv7+j8mO8s8ON9GJieJcvbBrHSc8norPJEjNtm/7Z4yv
         Fn77wCeRwfcsgeFmXcePj2b18hgAyNe4kwcA6eFsb/eBs8ttxL4rOxBugtzEWcLHQFWJ
         wQM7GhfQZlJCI3XczxR4AoDKQL8mp8TpHaP4pXJbJAdWmxd373wjmkcl/L0F7tX0Ds6t
         o1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738311755; x=1738916555;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PVysL2IB+DfURM1n+fDW+H+cpBepoWOEUh2zNKxVGc0=;
        b=aTYSNs6ZWTwzRc4+fSCNsJ2ht+dGpk0OzDp/6Eguka/3Wtlo+mxJ2fEKkIw9TnZdCw
         alm3/gsTE3bz5wDs9MJfK3utA02Y7n2WgCrV+SelA01hRVD8TG27qiuZbqVoQ1Gj5wcQ
         O7KZ89lN/p+n0ONbiw5qeEO7KiaCX22ZXZFCl7btAWuilxKxpd9nehRxO8+H5gAsQHJ1
         +si4GJtbf8NBoMO3xp/cdscwEImDY+MD9K1EfkqdYRRuVH5w3dF/PO9Zts8yKbvDxW8l
         uXOziXbzw643sy29rPQ8Zu7KI4+3H3XnPuB6pBkIsN3YFihgld165hkenkCd/YPZWwAm
         kokw==
X-Forwarded-Encrypted: i=1; AJvYcCVNvPgfPHMwi5qRA2xQsJji1R4oGBJIhTwvLWSMdtAbkbMe6v8KpZr+Rmab+ckcaNa7T/GvTnnNGPy2zPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyReVLHu3gg54OuBZERYO1lxo0mq0CJr0JijBNK4IbS0eHyNLLy
	zR8Bd0jCN9ybvg+B0CATOFqIEt8q094yXPOtipjrz+Tex0TY4YT5pnWX2Ifo0NE=
X-Gm-Gg: ASbGncuDzTU7/tTCFecEYyHGrDa2dd82kbK+gBM1Fvb4RGr0W3f7uOKrcBPVbLTS3+1
	JRc42t9g/gxO3DjoYYSTNtMrK6fHXASBQwj7dN6V52Q3LDARb8s4cdOg9enTtiSD/aru18NTcq2
	ZRHK2WElk9n9AuZBPh2eXFclu2T9sr1khZlvPBHtLLiA3wJSVOA8h6tPanBroz2r8uYVKuEWaEt
	NVFHIFkhJI/CKSMopmKVk/IOILdm4MJYry68ntrF3dLCbhOYhxCqj8D0foVtVMdqgZ3SvExVKJ4
	fjhfyTpX3QMBUwB2vxvoUN4mfo2iccdlynJ1YVyLNRVzpFW9GiJMB3W3pkmZrfXR6Xk7u9mmsNz
	7
X-Google-Smtp-Source: AGHT+IEf7md+H3SDDXI6rOSxfpejiJtQiNvxIjKyKYLNej1x2IF2EuQw7wriDNAtxkoE6uCd4ll+/w==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:9d49:3ae6 with SMTP id 98e67ed59e1d1-2f83abd7da8mr15929464a91.10.1738311755097;
        Fri, 31 Jan 2025 00:22:35 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3302a45sm25026465ad.177.2025.01.31.00.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 00:22:34 -0800 (PST)
Date: Fri, 31 Jan 2025 00:22:33 -0800
From: Ian To <onlyian4981@gmail.com>
To: dpenkler@gmail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: format no multiple blank lines
Message-ID: <Z5yISXwXoyl59XWo@DESKTOP-GL3U3CJ>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Avoid adding multiple blank lines. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.h b/drivers/staging/gpib/hp_82341/hp_82341.h
index 0065ebd9747c..d3cf1f43a1ef 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.h
+++ b/drivers/staging/gpib/hp_82341/hp_82341.h
@@ -26,7 +26,6 @@ struct hp_82341_priv {
 	enum hp_82341_hardware_version hw_version;
 };
 
-
 // interface functions
 int hp_82341_accel_read(gpib_board_t *board, uint8_t *buffer, size_t length, int *end,
 			size_t *bytes_read);
-- 
2.45.3

