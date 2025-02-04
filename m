Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C395E1E86E
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738641910; cv=none; b=iMlt2G2VeN7EXhixi0TY+4ozVCx67eNFjqtKnnNC8hmEYunw0HEvDxQc7zjar+kvJ8NUp/M28v15OrdLLD7yd1LCu5d7yMTCwJzTo9IbHTeWGuEgcNXYBP/Cqt+mXtp3fKsMcbE+BDsLY4EFLD9GaknOiXOnj7VXoUN7VFWB2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738641910; c=relaxed/simple;
	bh=Vxnh6+xTT3mfmU+W1fcRo6l4UAhI6aAlRz24hoWSY7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iWNVeJVT81XRRPXnpJp/2qxThE9ndt9l3yxDsfOc31wOlPwDzmETlWEn0rV4dtEaqrYTBCwKZAjkd9OadSlnnlHP9jLkhq2IB4BTMCK1YnIYeRqfgLMAUGlEoUxhEqhOQpJsnVpl4PWmgVPW/YpXUg6IYHP7JufR+vjw8nV9JkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLXxM2de; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLXxM2de"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21c2f1b610dso119759855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738641908; x=1739246708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7eXcg9KeqlWfwKNQSEP8zzvqopvqArIrP9n1hypurSE=;
        b=SLXxM2ded84/Oq0+/Krfsb7+Y0rLTA+VjbOuMEbYNt2NsJsBnBtvvaxXdLjwEKqgSQ
         n+zKO4s5cFP4CnLbSw5sf0DoXj77wcJt8ra2+vxT3UFTKLai9OuIpaOIfeFtHWBVwJHy
         XTfJv4CwqGRR8gu2az7mUOO2eS58eHDF5OriGfaS/Ar82U5N7FUGJ9/Wovd169XnmDuC
         RhVq4+vJdTYVJlIyQW74EAyVFc6DuNHmDJ50O/zKRUb3I9m7RYfODy59+FlMUUTT4FQC
         FLMH+SWCXHdDaz1jgqqsAjhK3ClIMhn9pZ3NzuHSsntT6FB25RsufJqy5oImD2D/sxWY
         MZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738641908; x=1739246708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eXcg9KeqlWfwKNQSEP8zzvqopvqArIrP9n1hypurSE=;
        b=JFPtvaUkGAHMErPgesodB7Ip94wnt7bw1vW2514f3CQY8bAoSM/QGoYnuRS0ycTe0k
         aI/cDtft9Q7xEmyEXbatIK/o4MOEGGriBnF4um+AwOk/akvgpWcMHW9arWT1ET91+lkz
         i/J3zE8pANVP9gfDjLCJl3Cc9WmK+Qg0BNdROVOU+SThM8YRaL0sIgZsIkehISuKfezp
         ywDAbzrrJDQ13t7ywB1AdQ+Ke+0oD1HxoTIQ+lnjZ5iaG26xZob6iCM6PDhXCCzjC7s8
         E/FDNa70AIHGUIisClGl/iwoIMA21sV4Zc56Rv36c3Zrg53yDtoPB6vb15Tfn+xB4JkN
         J2Ww==
X-Gm-Message-State: AOJu0Ywc65VQLgPyJyC7ubZ5+moQgeXcfFcibxXU2G1uELsh0NvkV1ZA
	MUhndSv/igJXt7nPZ1KkeQ21hDhuxS1iMdv32iDFSAlCCgG4E2dD
X-Gm-Gg: ASbGncsPcQsA3tCNvNEaPGHtoFQzlWFUbmAx61Mhw9NJ+55/V/ptMYsdPMV6AtJpbtt
	IeZQgH3205FmnpPrNSi/p8in/NIkWpLNrISPMdwslo2DOzUKta5O1+CBCLVOlGQGuuhgVMH2SCq
	hQpUy1yVOH9JYkyeWuqySr6s1i5QbIW4hBawDSl2it18cORgPmGLkto3qO7KesNQ5Krxb3frPAs
	ChRcpmYhB6kfTsmaAmCHrU9+Ba/sWZvvcqLGeAcu9/JgLM40mXFJwflMZaGJ8ziSw9M
X-Google-Smtp-Source: AGHT+IHIZcuSyQ5+NmER1YO4mQCv7TTWGuIvySaTy1/WVAORHQxwBW3A9WynUqBH4tgZ70+aClzcKA==
X-Received: by 2002:a17:902:f644:b0:216:2477:e4d3 with SMTP id d9443c01a7336-21dd7df6ad3mr357643275ad.51.1738641905729;
        Mon, 03 Feb 2025 20:05:05 -0800 (PST)
Received: from localhost.localdomain ([177.34.235.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de4a91af6sm83577295ad.17.2025.02.03.20.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 20:05:05 -0800 (PST)
From: Diego Viola <diego.viola@gmail.com>
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	Diego Viola <diego.viola@gmail.com>
Subject: [PATCH TRIVIAL] docs: admin-guide: rename GTK+ to GTK
Date: Tue,  4 Feb 2025 01:04:43 -0300
Message-ID: <20250204040444.6299-1-diego.viola@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream calls it "GTK" now, see [1]

[1] https://mail.gnome.org/archives/gtk-devel-list/2019-February/msg00000.html

Signed-off-by: Diego Viola <diego.viola@gmail.com>
---
 Documentation/admin-guide/README.rst                    | 2 +-
 Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
 Documentation/translations/zh_TW/admin-guide/README.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index eb9452668..d30867620 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -165,7 +165,7 @@ Configuring the kernel
 
      "make xconfig"     Qt based configuration tool.
 
-     "make gconfig"     GTK+ based configuration tool.
+     "make gconfig"     GTK based configuration tool.
 
      "make oldconfig"   Default all questions based on the contents of
                         your existing ./.config file and asking about
diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index e679cbc3c..1bdafdc4c 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -146,7 +146,7 @@ Linux内核6.x版本 <http://kernel.org/>
 
      "make xconfig"     基于Qt的配置工具。
 
-     "make gconfig"     基于GTK+的配置工具。
+     "make gconfig"     基于GTK的配置工具。
 
      "make oldconfig"   基于现有的 ./.config 文件选择所有选项，并询问
                         新配置选项。
diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index a6e34c200..0b038074d 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -149,7 +149,7 @@ Linux內核6.x版本 <http://kernel.org/>
 
      "make xconfig"     基於Qt的配置工具。
 
-     "make gconfig"     基於GTK+的配置工具。
+     "make gconfig"     基於GTK的配置工具。
 
      "make oldconfig"   基於現有的 ./.config 文件選擇所有選項，並詢問
                         新配置選項。
-- 
2.48.1

