Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE088F40;
	Tue, 10 Jun 2025 03:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749525450; cv=none; b=UIeZIgIZMwY9YR/bXKeAMGSnTQrcpIFQUniOYWWrc+LT+3QwxjWHVckNKJwhvyXWgO9sXS9WaavB1LlCBx3oNzcm5XmfDRHddIGS9cFflqwESbsqJBQFu7T02qSNqbz4uY/TJNPFj1HLSIMDTcaNnO+CT5IQDqSwkB9gaGdVEkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749525450; c=relaxed/simple;
	bh=45fnjTdYMVBPljf/aBVpxnA2I6FnEJGXBo6km1ABqaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKovybnTZn2vuvzFnqIHty30+vwqxYoDZavFBUKqwguZCn92YD0PKxCK1HmKS7AVX7WPpuzbQpi8Ze0ACxKf5tX7an/hQ22gY96psWnI19C9oy4tX0+39pumb0sPcVVGaF1H5xnkta2A5eg7+VHG5ZK4EIutoDRA5gR5IHmdmPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVWsOk9n; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVWsOk9n"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c46611b6so6250783b3a.1;
        Mon, 09 Jun 2025 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749525448; x=1750130248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm6kdcI4n1koVKJTIy10thiRxaSDuouUmD5o5Uuwua0=;
        b=BVWsOk9nObSf+DJaDodr7lOBoOOu406tRH6dMasdQFr8Vdl3cJlPek3VXDr0ZwXt6K
         y/5qjO9K8LUyOOGk+jm2BxmM5qj08b1+MQX4NkNw4wpGPlr8eYGlsiLMNIdegbmVdf1l
         oK7TzRqP1H0zPe3sW2vKtdr4b+Ucs889IsRjdOEsV8glZOX+aNV0B8t1B6GL/OCYJBZ4
         bB0N6lsc4J1WkW+GsU6U8/JHjpQDT7F7Wa1c/bvf0nSZh+MJgBwU0Ga/+avbxXjLo8Kp
         VbaHpyOgnU0Pk8m2hBVqv+JU2q48gonwFwRMNhMJBKahVH4qGDr9q2BCa3wAlSau5lND
         emVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749525448; x=1750130248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm6kdcI4n1koVKJTIy10thiRxaSDuouUmD5o5Uuwua0=;
        b=MyH5QqiEkXVce3eMe4TAcUSYomETC8y63nZ6jltipWDYjBHkvheIzUJiiNxFNNbOrr
         9lSxBr6ddVzUjv1yUxWqRzUZR95Iaqa6L7rUSKpPCy8VsEjWhhTCfGVvcNf41LXusBHs
         ya4ushxEpC6Ot/8tsgW8cWBRljyzfPaGYgryYxJQkZVg9A1AItvtZoAzaK0kQmFaGCtc
         9W69sZsu1533tq5H0Re0kJKuRpax0tA1u+mxtW5CstER3LhiEQhLSLJNcVS4ZBwvhLc5
         zOK726A+kgvCjYB/U2BBGafAdQxkWf4BQAm+DaADK1o90mYkOYKejboEs+Co78bDZkuu
         fwGA==
X-Forwarded-Encrypted: i=1; AJvYcCV8/60gwF1qb/8vsMiGPl3qPvo2ik6FpZ5fYi/9i0NEwfjW9n94usNhJ0xVwyuPGZviWsazgSfSZA8=@vger.kernel.org, AJvYcCWY2jb/sh4jF8UXfZhOaR3O0MIuCJ1vaXFLMPFuL+5ETn1VpeAduUTXpE4s/o+9ABGaIAV1V6obT9PS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6G1kstCV46ei53bE1wvIGEctpVRwaLI+474UFpl2aWYoLt+ML
	klVSoUqFQnlr4/5YNGse9JJSdEzZWb6WysN7581AONA2Ek/fNlya0fd2QMbWIw==
X-Gm-Gg: ASbGncveJL+xGYVW80udIqShMTIgbtI4MIESWjbC7NYIOidb3Tbz6EoA+OJ0ioJyYkz
	TPbU16p8nroGH+uhu+zYBVOI9MjagikTh1KUdmyC9Yu95z4fNlwI2vsN1MWP6eTQ0GIjNQ4xMNQ
	ZPUeeUdZ5oIJFb4dDmDWvJl/RgDZGM5w/099FdwpJdc17HRrI2BL7rI1iIQ/+/b5K197iBaebJV
	bonWslIjGJEpgCLDcyFXoY2Rix1Lp3GR0bitsYYfs5M4wUgAlWYH9VIs7TDtotlUJyHEZQmnY4J
	ePMtodKlw7Jk9nlDA+1e4QQItP1ULFd1lsPPC5YsPs7HPYAP4pXKQqCdqZhG/g==
X-Google-Smtp-Source: AGHT+IEvGrJH/l6/FleC+QIu6MpwoaBeq8cz4bgANMbiASmq7sOeOqr8hsR2xrYcawmWcsj7v+S3VQ==
X-Received: by 2002:a05:6a00:855:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-74827e52592mr20318563b3a.2.1749525448311;
        Mon, 09 Jun 2025 20:17:28 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b606sm6705494b3a.67.2025.06.09.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 20:17:27 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 19C7E4209E8C; Tue, 10 Jun 2025 10:17:25 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux USB <linux-usb@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Felipe Balbi <balbi@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH] Documentation: usb: gadget: Wrap remaining usage snippets in literal code block
Date: Tue, 10 Jun 2025 10:17:06 +0700
Message-ID: <20250610031705.32774-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2707; i=bagasdotme@gmail.com; h=from:subject; bh=45fnjTdYMVBPljf/aBVpxnA2I6FnEJGXBo6km1ABqaU=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnuiy1fmVcu2xR+/tqDtyGCR7wO20v0c7jtDGMsrY0w9 slsWvano5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABPxLWf4K/02JcKy/MiushVB bKIrqyN01rrplP5k0Xs51eHXLOsFCgz/nd5oze/p8DC6YdhxOKn7cXKvhWPEgeWeSmFT7KJjlE+ yAgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Several configfs usage snippets forget to be formatted as literal code
blocks. These were outputted in htmldocs output as normal paragraph
instead. In particular, snippet for custom string descriptors as added
in 15a7cf8caabee4 ("usb: gadget: configfs: Support arbitrary string
descriptors") is shown as single combined paragraph, rather than two
command lines.

Wrap them like the rest of snippets.

Fixes: 5e654a4655c3 ("Documentation/usb: gadget_configfs")
Fixes: d80b5005c5dd ("docs: usb: convert documents to ReST")
Fixes: 15a7cf8caabe ("usb: gadget: configfs: Support arbitrary string descriptors")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
This patch is based on Uwe's numbered list indentation patch [1].

[1]: https://lore.kernel.org/linux-doc/20250607224747.3653041-2-u.kleine-koenig@baylibre.com/

Cc: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 Documentation/usb/gadget_configfs.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/usb/gadget_configfs.rst b/Documentation/usb/gadget_configfs.rst
index f069d2a0d09251..ada57c0e34aa8a 100644
--- a/Documentation/usb/gadget_configfs.rst
+++ b/Documentation/usb/gadget_configfs.rst
@@ -92,7 +92,7 @@ Then the strings can be specified::
 
 Further custom string descriptors can be created as directories within the
 language's directory, with the string text being written to the "s" attribute
-within the string's directory:
+within the string's directory::
 
 	$ mkdir strings/0x409/xu.0
 	$ echo <string text> > strings/0x409/xu.0/s
@@ -104,9 +104,9 @@ string descriptors to associate those strings with class descriptors.
 ------------------------------
 
 Each gadget will consist of a number of configurations, their corresponding
-directories must be created:
+directories must be created::
 
-$ mkdir configs/<name>.<number>
+        $ mkdir configs/<name>.<number>
 
 where <name> can be any string which is legal in a filesystem and the
 <number> is the configuration's number, e.g.::
@@ -246,7 +246,7 @@ a symlink to a function being removed from the configuration, e.g.::
 	...
 	...
 
-Remove strings directories in configurations:
+Remove strings directories in configurations::
 
 	$ rmdir configs/<config name>.<number>/strings/<lang>
 
@@ -270,7 +270,7 @@ e.g.::
 	...
 	...
 
-Remove functions (function modules are not unloaded, though):
+Remove functions (function modules are not unloaded, though)::
 
 	$ rmdir functions/<name>.<instance name>
 
-- 
An old man doll... just what I always wanted! - Clara

