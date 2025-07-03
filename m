Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCC42DE6F3;
	Thu,  3 Jul 2025 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506641; cv=none; b=TNY3Kw/aQwCHt6wNfJmSkGbcLNSPTB9PYrm0mXJXSFmOTFUu3XqJlSJxTcoAXE1pB1+KSOYnY5BFgmJxIl+3xbwID4RTSvAhRBIgp4fH5IzbfDsHUyWO1rpQrrdYhbS1WlwmP+fOApz+38hAVosR2aQv6lfcC5xI0Df4K5mcAyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506641; c=relaxed/simple;
	bh=kNtpBg68NV1m6BIhW0MMPbHacSAZyPBh+LVLIKosOMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Up4mB6/vCn522hj8xxxJ+M24Pl+JVy8VVPd7wxwxp+Q6SFdF5Mr5lPGDfcObnXVAcFfRnIcZeZUsGT2iTKuZ2+RXdhAhfUn+PLDpE0BERirWycMSDoNKREKxQHNE7aKFsUCZvnHI+8bdeqHV9p/ntVjlfwJNARp7KV85qvB+oHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpWnPBU8; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpWnPBU8"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-237e6963f63so33200965ad.2;
        Wed, 02 Jul 2025 18:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751506639; x=1752111439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvCDWMLln/ahrHGmmbRxEQ1RAY121IXr+QwbBNoid08=;
        b=lpWnPBU881+aFebuBmXYE8sI5Yf6pUZrf6rm7Lyl1AdqXaNPuBtqcDiLQ7DCbSVTNo
         /tJYZP5LSc+4PAyoAqNWomB7UltWCNyRDAkHG9Z1LlOung0u1C/5VUmctf3700gbon7u
         wwgoo8L45D31uyL0RZixCTDX7envsnSpx/0vdvUfB9wRzS/icitXbY1Me5USs4LT7lk5
         TOLOjeSPWEW18cuXDk8lhXcwVglHdcr5mlh8isc2LBW2UXAiYbpmc3WEiBVgjtRhAGr2
         zhn93tkUP45e3/pgpTdBRcU+i4J8Sc5APH/Yf7cUxChPZKgGlA7POVqZJovN6YxjJjYH
         3lUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751506639; x=1752111439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvCDWMLln/ahrHGmmbRxEQ1RAY121IXr+QwbBNoid08=;
        b=UlT66vQ9hhMUo/fHj6ZFeeuoXPN7mNJRW63qeftyGQrf7MXMVv6vMqfARlm7vC3QKX
         Y+1NnXJIgBQaH2TmOc5UckqQwDuDhKeU66x4SQpH8NllxKrjsElLZ/4ZIM/EmjfxioJ0
         kMj9FNId9ySFsZQdotGRhLDnwxMH+BS+j9F5UkDX/fj4A7WJaJ2viQqfzkkhewV0oHFw
         uLkYtzRyGzIOojh5b6uph8wtbFbmZogHtWWtvubp+4Uz4rxOXjWiUJvWv+3Fy4J1cSzI
         0qj4+2vlQDxmBoWGh2E0Dx0BT2hTTjpa5oW+PSJcowlUZRmX0agByWj0sJ0M0sJmWGGd
         nkEg==
X-Forwarded-Encrypted: i=1; AJvYcCWsuatO57Q0eQyREaixFo1b0MFf7gHUj1rSf/+pCM+igdTxG1xLXcEizU/R5cE7mdBkx3CWwLexfmY=@vger.kernel.org, AJvYcCXm1795a8F+6B4iEC0iAA7H1KGqRgP+/bRmJbe7Sv2QxNoZA2ssStv7STLAruiIEv2gXcai20IkFji5HwGz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj0y0hpATouDa3JqQ4acVHGHimzu4T4uLo79qIvmvDCKpcYanH
	VkMp4T+2IKNEr8po+Q3eh/O5wbs3R+XeK3U4wZJmCced5aSA4vHVU0tb
X-Gm-Gg: ASbGncuKN/7R7Z740vY9XQio1XNBj6SjWpZSzkDn3oNbHyRuD58oRidfOMqPL/lKbH/
	fj9NaP4pd4hVEu+jkZPQTafdl0V4KohUgOJbSU9a4v13S+vTrQeZliKrVqtVWDjwNFSxu08Avui
	8LCEXPnW9YgoD3mFHRHFuXqy1QBh2s37kp5zAq3ed5WwfnM1LpPWBc+r6DgkYHFAYrodDXWi+Y4
	HF57Nb5dEiURBo1VNxSrItXGNi6uVBiPluV4AGomeI1NVYH/B2UuMggdhfHSh2Q52WPJ/dDczZW
	CJUAU7vDwbSTDzcSLVJVYu5IxH0YEOKRFSK/rP/e2cPzr+Wl238mackdnaTgUA==
X-Google-Smtp-Source: AGHT+IHquFt8RTXHvnm/riz/E91A3Nb+/8uDvmvkBoAtH6A8BtDLlsRrZA0Xa3exivhl3R7PCsmLGw==
X-Received: by 2002:a17:903:17c3:b0:234:ed31:fc96 with SMTP id d9443c01a7336-23c6e54ff82mr54833455ad.26.1751506638888;
        Wed, 02 Jul 2025 18:37:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bcbcsm138536385ad.134.2025.07.02.18.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 18:37:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 869E84206887; Thu, 03 Jul 2025 08:37:14 +0700 (WIB)
Date: Thu, 3 Jul 2025 08:37:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, kernel@collabora.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: document linked lists
Message-ID: <aGXeyqygzKi2P-kP@archie.me>
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6rDAoiH4BJjp6Kfi"
Content-Disposition: inline
In-Reply-To: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>


--6rDAoiH4BJjp6Kfi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 10:24:47PM +0200, Nicolas Frattaroli wrote:
> +In State 2, we've added Grock after the list head::
> +
> +         .--------------------.
> +         v                    |
> +    .--------.     .-------.  |
> +    | clowns |---->| Grock |--'
> +    '--------'     '-------'

Looks like the corners are a bit imbalanced (single quotes are taller than
dots). What about using plus instead? Like:

---- >8 ----
diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.=
rst
index b0586056abb04d..bf92f44d7b2d06 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -148,11 +148,11 @@ clarity.
=20
 In State 2, we've added Grock after the list head::
=20
-         .--------------------.
+         +--------------------+
          v                    |
-    .--------.     .-------.  |
-    | clowns |---->| Grock |--'
-    '--------'     '-------'
+    +--------+     +-------+  |
+    | clowns |---->| Grock |--+
+    +--------+     +-------+
=20
 This diagram shows the "clowns" node pointing at a new node labeled "Grock=
".
 The Grock node is pointing back at the "clowns" node.

The docs wording looks good, though.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--6rDAoiH4BJjp6Kfi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaGXexgAKCRD2uYlJVVFO
o4eVAP9pUgG8hSCkeS6YHXeqicCzRKmO7X1mcMvMgCanzdJBDgEA1gyL/7ua/B1t
t4yCErU51op1KfAXfGAkAP8OLU3c2g8=
=bUkw
-----END PGP SIGNATURE-----

--6rDAoiH4BJjp6Kfi--
