Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49C63085D4;
	Thu, 19 Jun 2025 04:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750307048; cv=none; b=HLsFbi1IfybLMQkJyzSFBaLGdmh3tN8JluM83WZzpbzuA6GhCo2H5MpH8KMYZKrQhqXDAGaajnucZUODYoS+mdNB+f4W7GP6HJLu94kI1/LYXPkQGjk7aVu6hTe94CdYSP/XaO+JK/lDwSA342IbN3EPLt46FtirhsaL5yNPu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750307048; c=relaxed/simple;
	bh=yz3ZQMIEriEnCqc438YPGaXiWfXmSgv6vPoloRENj1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uev5n6OKNO9Bhqo8bW2Q4WAjZxphy3ZrTSf8sJ9/V6Zzk30Yu94Fz49T9OH6aNd5imIhyRC/VBhFZabGC66y5KR+GmC7ddyGsByArubV0Y6P4mAGCSU2ktiiK5+FHoKbaISYsSZ7KEfL7tHid8c1sy4osBMOC0H6IcUhVqoo4FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk7siBdE; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk7siBdE"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748e81d37a7so211545b3a.1;
        Wed, 18 Jun 2025 21:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750307046; x=1750911846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IM49fVJ6MZw3k4kYOzxXG3XciKGBb7idFJNrb1tYtVs=;
        b=Tk7siBdE6FHtNvg+HdDKS89fRQ29ixo16vmQ/W56/VakBVqGtNCAI4UYXQjxmLVfwv
         wGuVCIAKkseg5ZTfMxyhGTUrWsVzlBnHEwSoxkCorB6zHNDpvjR/60qmbEqnnQMOWaB9
         bQrrr62UsKs2OKoKJUo9zHmfIYp7zn/kFYjWbDvFU1e1iDG9xEGSOBCglR4x1gCRXsyU
         ERdAhRIAsJUisXI46Z58S44Ci4dLYS/KM1gGwKwfPR5qETF0yJsWkq3j9bFG4o3g+Wmi
         +uNZKAY51t+wtbdmP7eJkeEHQVFZMDOkVVw7c5QWuZOXXeX12NTT+Y67BKl9QDwbSrT9
         H1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750307046; x=1750911846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IM49fVJ6MZw3k4kYOzxXG3XciKGBb7idFJNrb1tYtVs=;
        b=i3mteg++B0yMzn+eRG8OuCh4TjZwN8cxeSBcQ9gzhq2EXq64eLPHsMolY7IsmjLP+r
         07aRLxgFbZsOU6nuR5Eedxl0Gre1J6iTHAEf4xCSJhZNC5uahxeF8NTBskpKkN/+jQpx
         ud0vyuYOVwzMfs3vEEKNfOpgG0Y0HTMwBdfeMKskC267uQXVyPXfrz8fI22SWpHaVjU9
         EDeWhXk54q0Y2MmMoj6YlAckR49pNkAgMyFdY1f+vhwjB2XSPYH8oIQrlVUdqB3JH350
         SQL1EsR8AId48mMcKQo0Zg/0P60tFQw24Vv+R5nS0Wojuwh4A+Z3BIp/TCi8eFVN3IkI
         L1rg==
X-Forwarded-Encrypted: i=1; AJvYcCW2cB7qCGF/eYpGAxojUa06+NVL5GFuHfPOFsMOhCK7gsqS7XLIJpIJr+QOBweWVxzK4/da5K/IhIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjPoI49J7EZ3mQ8e2A+G3u9QXqiBSKNSAqUTyNK0g1JL5CeypN
	t6/LwYBosRxB8GudBA9W5F77o3/6QDlscKe83LNUvI/Mn9GwwAusbk6o
X-Gm-Gg: ASbGncvj9c+hFSQRAC79wlDIb98q9IYxM2/DIFqfqQ2tSm5vcqTRPC3rtZcGnKjExD+
	eRPL3ycwxpuo4eAAnTYOva+jgWsmyAtldy5aJgQ9gMV15tVSGUU5OqoXDzqFCYoRZwI/E+v7gKN
	IoVSlSnz+xlRiqdF6kWsoluO6tnZDxW/sATre2NvvSAs8hvR53h9JfPENn64iE33asDKxfw8lhD
	rtyTIQcFaPF4GgDaqEPBzIEeXxdAf9Tc4cTUFC4ylZ6ceNalSWlBgs4ju9yiGWjRXPEN7DiJqda
	D+eqLsfSNxrT0lwEB1ATzUxF49p75ef91GfG+F8GarBMmMzH/rYu2tgh5Svht8rsdTo7FdEK
X-Google-Smtp-Source: AGHT+IEUsYeuG83Ph7TAiVJBU14+TiRKEz17296qmmYUOcnaKXuQ+UZwC1iYvzkGovUliqf9E/QmuQ==
X-Received: by 2002:a05:6a21:3982:b0:201:2834:6c62 with SMTP id adf61e73a8af0-21fbd5f2087mr31119886637.25.1750307045759;
        Wed, 18 Jun 2025 21:24:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d1ceesm12082322b3a.161.2025.06.18.21.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 21:24:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F2BD6424181A; Thu, 19 Jun 2025 11:23:58 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH RFC] Documentation: typography refresh
Date: Thu, 19 Jun 2025 11:23:19 +0700
Message-ID: <20250619042318.17325-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182; i=bagasdotme@gmail.com; h=from:subject; bh=yz3ZQMIEriEnCqc438YPGaXiWfXmSgv6vPoloRENj1o=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBnBfR9v7Ym5N+PuZpn08v/sqy64hDNxmyjZmlRMWGN+R sagcOe9jlIWBjEuBlkxRZZJiXxNp3cZiVxoX+sIM4eVCWQIAxenAEyEo4KR4ei9E2//sPmzTXtu 3brhe/vWXUY3l7Wf2F7e4qt95crpl/sZGdaYTwu++Udn73GJ4xuVStPznzf3nuKNDGJ0PH1i7/Y ZkkwA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

At present, kernel documentation uses system serif font for body text.
Some people, however, objected to it and instead prefer that the
typography choice must be legible, consistent, and accessible (after
all, the audience ranges developers peeking into kernel internals to
ordinary users that skimmed through Documentation/admin-guide/).

To tackle the problem, follow Wikimedia's typography refresh [1].
For the font choices, instead of using web fonts as in previous
attempt [2], use:

  * Linux Libertine, Georgia, Times for serif (used in h1 and h2
    headings)
  * system font for sans-serif and monospace

This allows for more readability and consistency without sacrificing
page load times and bandwidth, as the font choices is most likely
already available on many platforms.

The reason why serif fonts is used for headings in complement to sans
serif in text body is to break up visual monotony of docs page by
creating contrast between headings (as entry point to docs information)
and text body, which is important considering that kernel docs are
quite lengthy with many sections.

For body text (excluding sidebar), it is set to #252525 on top
of #FFFFFF background as they have contrast ratio 15.3:1, which
is rated as AAA according to WCAG 2.0 section 1.4.6. Having slightly
off-black foreground text on white background can reduce eye strain
and juxtaposition on dyslexic readers.

This refresh only applies to default Alabaster theme.

[1]: https://www.mediawiki.org/wiki/Typography_refresh
[2]: https://lore.kernel.org/linux-doc/20231102123225.32768-1-bagasdotme@gmail.com/

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/conf.py                      |  5 +-
 Documentation/sphinx-static/typography.css | 62 ++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/sphinx-static/typography.css

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 12de52a2b17e78..f5713cd70cc17c 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -310,9 +310,12 @@ if  html_theme == 'alabaster':
         'sidebar_width': '15em',
         'fixed_sidebar': 'true',
         'font_size': 'inherit',
-        'font_family': 'serif',
     }
 
+    html_css_files  = [
+        'typography.css',
+    ]
+
 sys.stderr.write("Using %s theme\n" % html_theme)
 
 # Add any paths that contain custom static files (such as style sheets) here,
diff --git a/Documentation/sphinx-static/typography.css b/Documentation/sphinx-static/typography.css
new file mode 100644
index 00000000000000..c3d16186aca4a7
--- /dev/null
+++ b/Documentation/sphinx-static/typography.css
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+:root {
+	/* Font stack inspired by https://www.mediawiki.org/wiki/Typography_refresh */
+	--font-family-sans: sans-serif;
+	--font-family-serif: "Linux Libertine", Georgia, Times, "Source Serif Pro", serif;
+	--font-family-monospace: monospace;
+}
+
+body {
+	font-family: var(--font-family-sans);
+}
+
+div.body {
+	color: #252525;
+}
+
+div.sphinxsidebar h3,
+div.sphinxsidebar h4,
+div.sphinxsidebar input {
+	font-family: var(--font-family-sans);
+}
+
+div.admonition p.admonition-title {
+	font-family: var(--font-family-sans);
+}
+
+span.menuselection {
+	font-family: var(--font-family-sans);
+	/*
+	 * Distinguish menu text from regular prose by giving it
+	 * the same background color as inline pre-formatted text.
+	 */
+	background-color: #ecf0f3;
+}
+
+div.body h1,
+div.body h2 {
+	font-family: var(--font-family-serif);
+}
+
+div.body h3,
+div.body h4,
+div.body h5,
+div.body h6 {
+	font-family: var(--font-family-sans);
+}
+
+code,
+kbd,
+pre,
+samp,
+tt,
+span.pre {
+	font-family: var(--font-family-monospace);
+	/*
+	 * Bump monospace font-size as default (100%) is constrastingly
+	 * too small (10.8px compared to 16px) in certain fonts
+	 * (e.g. DejaVu Sans Mono).
+	 */
+	font-size: 110%;
+}

base-commit: d3f825032091fc14c7d5e34bcd54317ae4246903
-- 
An old man doll... just what I always wanted! - Clara

