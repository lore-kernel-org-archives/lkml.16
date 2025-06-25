Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844602D3A8C;
	Wed, 25 Jun 2025 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868650; cv=none; b=EEIs+9Ctkf8jNwwnr5WWDAnj/RtECge+OuptUzW3AYCOj/ZJtqpqWkFr7kCqmxvxsocHPF2kqyaf1vpM0DZH88MC+toW5w5XJ3Y+f5eg+i8rRYKeuDo+fvH7sB2IN4769OLbgKPb/rCcP860NWhneM0WN4VN4hkvDkalh4e0b04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868650; c=relaxed/simple;
	bh=FX0TlUtW21rRfijrkttgymR+U8GFpunjd416I7+hI50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gXlszzVHVoBt0iGmOV6QL7cf+hiEHJKzRdUGYsDJvqxEXO/kM+tjkUiEyWPHPnWAed9N+njXLR/ZI9C/F3UbnAP9hhv0o6zPH0FOgcWAyBSDgynGA+Lvz7Nqw41QAnDnt9Rqkef+bqPrb4uvLnKCS4spXGxhr5V8+Q3K99f4v3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmTJvs5X; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmTJvs5X"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313a188174fso1127991a91.1;
        Wed, 25 Jun 2025 09:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750868648; x=1751473448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/SU6GEn7zDb9tgmEbrw2Ziqn0f/ZLl3SxOYdJMPvrI=;
        b=CmTJvs5XyUn65x2izZ9FHZffixCjseRrHZ39NHUs1DIGqK8vDPCTEZ6qMPONjyapP8
         lTMr4j0qto0covNXF2NYwQFfibc83QvbpvYiRW9tBgeh7YSgP3+36HUjZI14oC5D68U7
         4/TOPEenXRVLLm+ITaO0rVGdtjT/PESg7MT03i3XWrnyNGU0IYzMrHdU83LAy6vLFTLw
         zwZFo5qN3MmGna9p5+jz+tYb0gReS5td7El234GYMqAAQfm0Ql057C3Z5AcTTo0tNWOG
         21Mr06LU4HJSlYZTCJ8SF7r/DwCaQxMipdsoVOA868Pubi46d3/9pPYxjFo/9V9OyVTA
         udSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868648; x=1751473448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/SU6GEn7zDb9tgmEbrw2Ziqn0f/ZLl3SxOYdJMPvrI=;
        b=Q8yeare09uRU+TmkipeL0f4T0NFV9pblduhwgO1yGPyY6yyKBCExZET8+cKcQBl1aC
         lNiOGlHy7bFC7kFFvTK6aJA/D3hPjjc/nrlDWuDtyPlBi9yQQGd17dmHxEdtLTlXFr9/
         Wx56FurDlzOsUIVYj2mIpVOqBSzC7wKq5gdh3rZmZO021fNW4vsy3zAfXmw67B4quNHr
         Ii7NFfNsU0iDnrHX9I1oxTm0pRGGWR1BF8B/kEadP4eltdB9SrizzziCJlcXCPF0Ni43
         fbX7GK97jPZBSNGfs3SVyqIgWCWZ+HcdJYtkdO+V/ni4Nj7vG4dTzGmL+amBDflYY2HN
         NH8g==
X-Forwarded-Encrypted: i=1; AJvYcCXEjYyL2HydoDx8WVdvxPWRNYlbupaJ5afSH3hRZrX4gIa33Yv1ZWx5WwqMPY4eduzSDFl+9ddQq2JC2w8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx5YNL0l3/VqvJOMd8n8glpuuz9qv56J2w/P4V1DiAGkViSf5e
	eaKwcQYUY2g7WOClciY2VSUlLsF/v0U3w7lRXfkc4BYyZqKNH4VY9X2t
X-Gm-Gg: ASbGncsoUVADUSwzER43BibAXL0zfCpTap7bkbXES+qPeGG9crTRq75adk2Vcudo8vu
	V4RwleqTdFJcHrbFQda1dW1goWZNh7jwydVtYeqoZJCfQIjBAzmp7vtI/AwJ3R6OLalyujhnpJq
	lPSxODfne4HuBAwc/DfRnpsxEDhFvUSA4Xm+v2k090n3asqJiXWaQVCnrRbDz6q4Q0WOxQHlhP/
	mI9HVOcX+euxPPjUJPpiFAhRLp54ryu59GlggwE+sZdIPcu9Go3LRQ8GoO1cGsA6tLN43ojHf8y
	cuYOXQHUlIiaigGbpQ2/YfjMWZheA1ApJOmxmpm9ti5SROHK5zQ9
X-Google-Smtp-Source: AGHT+IGH9DglrgBcKv7FgR7O69nfnelN+5Uxf3sXb/naee3g27FwO51zOKfliJWx6tPan524WVM5DA==
X-Received: by 2002:a17:90b:558c:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-316d69f4a02mr282940a91.10.1750868647595;
        Wed, 25 Jun 2025 09:24:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:116a:400:f32b:ad5e:ec3f:b2dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5386edbsm2311631a91.6.2025.06.25.09.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:24:07 -0700 (PDT)
From: Sai Vishnu M <saivishnu725@gmail.com>
X-Google-Original-From: Sai Vishnu M
To: corbet@lwn.net,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH 3/4] scripts: sphinx-pre-install: add fallback to distro detection
Date: Wed, 25 Jun 2025 21:52:36 +0530
Message-ID: <20250625162237.3996-3-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625162237.3996-1-saivishnu725@gmail.com>
References: <20250625162237.3996-1-saivishnu725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Implement derived_distro_detection to prompt users to select a base
distro in interactive mode for unrecognized distributions. Move the
fallback code for unknown distributions to fallback_unknown_distro.
Update check_distros to use these functions.

Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
Patch series history:
1 -> implement the --interactive flag
2 -> add run_if_interactive subroutine

Testing:
=========
Tested on a Debian container

Steps taken:
1. Start a container with all files
        podman pull docker.io/debian:bookworm
        mkdir -p /tmp/sphinx-test/Documentation
        cp ./scripts/sphinx-pre-install /tmp/sphinx-test
        cp ./Documentation/conf.py /tmp/sphinx-test/Documentation
        cd /tmp/sphinx-test
        podman run -it --rm -v $(pwd):/work:z debian:bookworm bash

2. Modify /etc/os-release to simulate an unknown distro:
        echo -e 'NAME="UnknownDistro"\nID=unknowndistro' > /etc/os-release
        rm /etc/lsb-release 2>/dev/null

3. Install perl and dependencies
        apt-get update && apt-get install -y perl sudo

4. Run the script in interactive mode
        cd /work; perl sphinx-pre-install --interactive

 scripts/sphinx-pre-install | 63 ++++++++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 16eb739fd633..e4f8a658857a 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -355,6 +355,51 @@ sub run_if_interactive($)
 	}
 }
 
+sub fallback_unknown_distro()
+{
+	# Fall-back to generic hint code for other distros
+	# That's far from ideal, especially for LaTeX dependencies.
+	my %map = (
+		"sphinx-build" => "sphinx"
+	);
+	check_missing_tex(2) if ($pdf);
+	check_missing(\%map);
+	print "I don't know distro $system_release.\n";
+	print "So, I can't provide you a hint with the install procedure.\n";
+	print "There are likely missing dependencies.\n";
+}
+
+#
+# if the distribution is not recognised
+# but it is derived from the available options
+#
+sub derived_distro_detection()
+{
+	my @distros = (
+		{ name => "Debian/Ubuntu", func => \&give_debian_hints },
+		{ name => "RedHat/CentOS/Fedora", func => \&give_redhat_hints },
+		{ name => "OpenSUSE", func => \&give_opensuse_hints },
+		{ name => "Mageia", func => \&give_mageia_hints },
+		{ name => "Arch Linux", func => \&give_arch_linux_hints },
+		{ name => "Gentoo", func => \&give_gentoo_hints },
+	);
+	print "Which distro is your OS based on?\n";
+	for my $i (0 .. $#distros) {
+		printf("[%d] %s\n", $i + 1, $distros[$i]->{name});
+	}
+	print "[99] Others\n";
+
+	print "Select a number: ";
+	my $choice = <STDIN>;
+	chomp $choice;
+
+	if ($choice =~ /^\d+$/ && $choice >= 1 && $choice <= scalar(@distros)) {
+		$distros[$choice - 1]->{func}->();
+	} else {
+		fallback_unknown_distro();
+	}
+}
+
 #
 # Subroutines that check distro-specific hints
 #
@@ -695,19 +740,11 @@ sub check_distros()
 		give_gentoo_hints;
 		return;
 	}
-
-	#
-	# Fall-back to generic hint code for other distros
-	# That's far from ideal, specially for LaTeX dependencies.
-	#
-	my %map = (
-		"sphinx-build" => "sphinx"
-	);
-	check_missing_tex(2) if ($pdf);
-	check_missing(\%map);
-	print "I don't know distro $system_release.\n";
-	print "So, I can't provide you a hint with the install procedure.\n";
-	print "There are likely missing dependencies.\n";
+	if ( $interactive ) {
+		derived_distro_detection();
+		return;
+	}
+	fallback_unknown_distro();
 }
 
 #
-- 
2.49.0

