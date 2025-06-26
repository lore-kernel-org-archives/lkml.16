Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FDB25485A;
	Thu, 26 Jun 2025 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925323; cv=none; b=QcJ3u0Si0p3adS6FGkfX7Ym8SIM+1QyyxTxYqc7v+K6IouKPUGN8YlOBO9Qf4CmKnkUIw5ZTDbyCzBybTru7z+ugLb3/UycvHBgyyUNM1oxhp5t2mV/zRE5rEIISVlamkB9omyVGcT6pkeRQp4BeVno045icBM2FSyrYP6uHgBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925323; c=relaxed/simple;
	bh=nh7Y8HiXV7GHEBTrnNtSelalQ1NDcfK4vUPeM/qZZzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/d+WDZ1pbuRIWIb1DQ5yklDR/KYUzQHmBsL+aQCwRxxQwkOL/7MmMdG0eSFWpEfyM9GAmW6HEJgOI6dzZDjfDC5rw14FYm7n1RPb/79r8hAiQkoV2dcBNr9Vqw9Tgx4lRW9NAQeAzgkR9w3wbrcUsnkz0riYAz6sMGlR0VrkEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGUXIHZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGUXIHZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E70C4CEEB;
	Thu, 26 Jun 2025 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750925323;
	bh=nh7Y8HiXV7GHEBTrnNtSelalQ1NDcfK4vUPeM/qZZzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EGUXIHZS/j+jydmICD/nHMsFGqXc7j6L2Ea+cK28tGuVqmypaCg0ZgIfGVzQMDAbC
	 4eplcdEy3+DWZvdLKpYhI7cn/bG+oVkJ2kdPDOCe1UfMb183dAgN4+XT7a/XQ0+NPq
	 j/8cRK5Fc27gDxdMdJE+7FpKJhOz5UZZDmmma9glCiW3oZrmqUceM5525TSfpUz1Wb
	 Kxy7UYvvPDUKn73Y0lHngYfiwCjX46YRMKKDD0Cvj7ZpPd3bM51r7hR8R9U6qOv45l
	 SiIQaEcU606aWH0O6EBlX+EOlxROLM/94B1J3ueV55JbxsPZnlrngxohX0RT4egVCS
	 FUhOf4f4VXKiw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uUhcz-00000004slR-3EMk;
	Thu, 26 Jun 2025 10:06:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] scripts: sphinx-pre-install: replace it by a Python version
Date: Thu, 26 Jun 2025 10:06:31 +0200
Message-ID: <47fce85fa3ac21cab4bed948c1e6820c0383c7f1.1750924501.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750924501.git.mchehab+huawei@kernel.org>
References: <cover.1750924501.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This script provides identical results as the previous one,
except for some reorders (now packages are sorted), and
a couple of extra blank lines on gentoo that were removed
at the Python version.

Tested with:

  - centos
  - oracle
  - fedora
  - ubuntu
  - ubuntu-lts
  - debian
  - opensuse
  - mageia
  - archlinux
  - gentoo

Changelog is confusing, but this patch just does:

	git rm scripts/sphinx-pre-install
	git mv scripts/sphinx-pre-install.py scripts/sphinx-pre-install

Without doing any changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install    | 2144 +++++++++++++++++----------------
 scripts/sphinx-pre-install.py | 1102 -----------------
 2 files changed, 1095 insertions(+), 2151 deletions(-)
 delete mode 100755 scripts/sphinx-pre-install.py

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 07234d482fa8..ad6384166916 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -1,1056 +1,1102 @@
-#!/usr/bin/env perl
+#!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0-or-later
-use strict;
-
-# Copyright (c) 2017-2020 Mauro Carvalho Chehab <mchehab@kernel.org>
-#
-
-my $prefix = "./";
-$prefix = "$ENV{'srctree'}/" if ($ENV{'srctree'});
-
-my $conf = $prefix . "Documentation/conf.py";
-my $requirement_file = $prefix . "Documentation/sphinx/requirements.txt";
-my $virtenv_prefix = "sphinx_";
-
-#
-# Static vars
+# Copyright (c) 2017-2025 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
 #
+# pylint: disable=C0103,C0114,C0115,C0116,C0301
+# pylint: disable=R0902,R0904,R0912,R0915,R1705,R1710,E1121
 
-my %missing;
-my $system_release;
-my $need = 0;
-my $optional = 0;
-my $need_symlink = 0;
-my $need_sphinx = 0;
-my $need_pip = 0;
-my $need_virtualenv = 0;
-my $rec_sphinx_upgrade = 0;
-my $verbose_warn_install = 1;
-my $install = "";
-my $virtenv_dir = "";
-my $python_cmd = "";
-my $activate_cmd;
-my $min_version;
-my $cur_version;
-my $rec_version = "3.4.3";
-my $latest_avail_ver;
 
-#
-# Command line arguments
-#
+import argparse
+import os
+import re
+import subprocess
+import sys
+from glob import glob
 
-my $pdf = 1;
-my $virtualenv = 1;
-my $version_check = 0;
 
+def parse_version(version):
+    """Convert a major.minor.patch version into a tuple"""
 #
-# List of required texlive packages on Fedora and OpenSuse
-#
-
-my %texlive = (
-	'amsfonts.sty'       => 'texlive-amsfonts',
-	'amsmath.sty'        => 'texlive-amsmath',
-	'amssymb.sty'        => 'texlive-amsfonts',
-	'amsthm.sty'         => 'texlive-amscls',
-	'anyfontsize.sty'    => 'texlive-anyfontsize',
-	'atbegshi.sty'       => 'texlive-oberdiek',
-	'bm.sty'             => 'texlive-tools',
-	'capt-of.sty'        => 'texlive-capt-of',
-	'cmap.sty'           => 'texlive-cmap',
-	'ecrm1000.tfm'       => 'texlive-ec',
-	'eqparbox.sty'       => 'texlive-eqparbox',
-	'eu1enc.def'         => 'texlive-euenc',
-	'fancybox.sty'       => 'texlive-fancybox',
-	'fancyvrb.sty'       => 'texlive-fancyvrb',
-	'float.sty'          => 'texlive-float',
-	'fncychap.sty'       => 'texlive-fncychap',
-	'footnote.sty'       => 'texlive-mdwtools',
-	'framed.sty'         => 'texlive-framed',
-	'luatex85.sty'       => 'texlive-luatex85',
-	'multirow.sty'       => 'texlive-multirow',
-	'needspace.sty'      => 'texlive-needspace',
-	'palatino.sty'       => 'texlive-psnfss',
-	'parskip.sty'        => 'texlive-parskip',
-	'polyglossia.sty'    => 'texlive-polyglossia',
-	'tabulary.sty'       => 'texlive-tabulary',
-	'threeparttable.sty' => 'texlive-threeparttable',
-	'titlesec.sty'       => 'texlive-titlesec',
-	'ucs.sty'            => 'texlive-ucs',
-	'upquote.sty'        => 'texlive-upquote',
-	'wrapfig.sty'        => 'texlive-wrapfig',
-	'ctexhook.sty'       => 'texlive-ctex',
-);
-
-#
-# Subroutines that checks if a feature exists
-#
-
-sub check_missing(%)
-{
-	my %map = %{$_[0]};
-
-	foreach my $prog (sort keys %missing) {
-		my $is_optional = $missing{$prog};
-
-		# At least on some LTS distros like CentOS 7, texlive doesn't
-		# provide all packages we need. When such distros are
-		# detected, we have to disable PDF output.
-		#
-		# So, we need to ignore the packages that distros would
-		# need for LaTeX to work
-		if ($is_optional == 2 && !$pdf) {
-			$optional--;
-			next;
-		}
-
-		if ($verbose_warn_install) {
-			if ($is_optional) {
-				print "Warning: better to also install \"$prog\".\n";
-			} else {
-				print "ERROR: please install \"$prog\", otherwise, build won't work.\n";
-			}
-		}
-		if (defined($map{$prog})) {
-			$install .= " " . $map{$prog};
-		} else {
-			$install .= " " . $prog;
-		}
-	}
-
-	$install =~ s/^\s//;
-}
-
-sub add_package($$)
-{
-	my $package = shift;
-	my $is_optional = shift;
-
-	$missing{$package} = $is_optional;
-	if ($is_optional) {
-		$optional++;
-	} else {
-		$need++;
-	}
-}
-
-sub check_missing_file($$$)
-{
-	my $files = shift;
-	my $package = shift;
-	my $is_optional = shift;
-
-	for (@$files) {
-		return if(-e $_);
-	}
-
-	add_package($package, $is_optional);
-}
-
-sub findprog($)
-{
-	foreach(split(/:/, $ENV{PATH})) {
-		return "$_/$_[0]" if(-x "$_/$_[0]");
-	}
-}
-
-sub find_python_no_venv()
-{
-	my $prog = shift;
-
-	my $cur_dir = qx(pwd);
-	$cur_dir =~ s/\s+$//;
-
-	foreach my $dir (split(/:/, $ENV{PATH})) {
-		next if ($dir =~ m,($cur_dir)/sphinx,);
-		return "$dir/python3" if(-x "$dir/python3");
-	}
-	foreach my $dir (split(/:/, $ENV{PATH})) {
-		next if ($dir =~ m,($cur_dir)/sphinx,);
-		return "$dir/python" if(-x "$dir/python");
-	}
-	return "python";
-}
-
-sub check_program($$)
-{
-	my $prog = shift;
-	my $is_optional = shift;
-
-	return $prog if findprog($prog);
-
-	add_package($prog, $is_optional);
-}
-
-sub check_perl_module($$)
-{
-	my $prog = shift;
-	my $is_optional = shift;
-
-	my $err = system("perl -M$prog -e 1 2>/dev/null /dev/null");
-	return if ($err == 0);
-
-	add_package($prog, $is_optional);
-}
-
-sub check_python_module($$)
-{
-	my $prog = shift;
-	my $is_optional = shift;
-
-	return if (!$python_cmd);
-
-	my $err = system("$python_cmd -c 'import $prog' 2>/dev/null /dev/null");
-	return if ($err == 0);
-
-	add_package($prog, $is_optional);
-}
-
-sub check_rpm_missing($$)
-{
-	my @pkgs = @{$_[0]};
-	my $is_optional = $_[1];
-
-	foreach my $prog(@pkgs) {
-		my $err = system("rpm -q '$prog' 2>/dev/null >/dev/null");
-		add_package($prog, $is_optional) if ($err);
-	}
-}
-
-sub check_pacman_missing($$)
-{
-	my @pkgs = @{$_[0]};
-	my $is_optional = $_[1];
-
-	foreach my $prog(@pkgs) {
-		my $err = system("pacman -Q '$prog' 2>/dev/null >/dev/null");
-		add_package($prog, $is_optional) if ($err);
-	}
-}
-
-sub check_missing_tex($)
-{
-	my $is_optional = shift;
-	my $kpsewhich = findprog("kpsewhich");
-
-	foreach my $prog(keys %texlive) {
-		my $package = $texlive{$prog};
-		if (!$kpsewhich) {
-			add_package($package, $is_optional);
-			next;
-		}
-		my $file = qx($kpsewhich $prog);
-		add_package($package, $is_optional) if ($file =~ /^\s*$/);
-	}
-}
-
-sub get_sphinx_fname()
-{
-	if ($ENV{'SPHINXBUILD'}) {
-	    return $ENV{'SPHINXBUILD'};
-	}
-
-	my $fname = "sphinx-build";
-	return $fname if findprog($fname);
-
-	$fname = "sphinx-build-3";
-	if (findprog($fname)) {
-		$need_symlink = 1;
-		return $fname;
-	}
-
-	return "";
-}
-
-sub get_sphinx_version($)
-{
-	my $cmd = shift;
-	my $ver;
-
-	open IN, "$cmd --version 2>&1 |";
-	while (<IN>) {
-		if (m/^\s*sphinx-build\s+([\d\.]+)((\+\/[\da-f]+)|(b\d+))?$/) {
-			$ver=$1;
-			last;
-		}
-		# Sphinx 1.2.x uses a different format
-		if (m/^\s*Sphinx.*\s+([\d\.]+)$/) {
-			$ver=$1;
-			last;
-		}
-	}
-	close IN;
-	return $ver;
-}
-
-sub check_sphinx()
-{
-	open IN, $conf or die "Can't open $conf";
-	while (<IN>) {
-		if (m/^\s*needs_sphinx\s*=\s*[\'\"]([\d\.]+)[\'\"]/) {
-			$min_version=$1;
-			last;
-		}
-	}
-	close IN;
-
-	die "Can't get needs_sphinx version from $conf" if (!$min_version);
-
-	$virtenv_dir = $virtenv_prefix . "latest";
-
-	my $sphinx = get_sphinx_fname();
-	if ($sphinx eq "") {
-		$need_sphinx = 1;
-		return;
-	}
-
-	$cur_version = get_sphinx_version($sphinx);
-	die "$sphinx didn't return its version" if (!$cur_version);
-
-	if ($cur_version lt $min_version) {
-		printf "ERROR: Sphinx version is %s. It should be >= %s\n",
-		       $cur_version, $min_version;
-		$need_sphinx = 1;
-		return;
-	}
-
-	return if ($cur_version lt $rec_version);
-
-	# On version check mode, just assume Sphinx has all mandatory deps
-	exit (0) if ($version_check);
-}
-
-#
-# Ancillary subroutines
-#
-
-sub catcheck($)
-{
-  my $res = "";
-  $res = qx(cat $_[0]) if (-r $_[0]);
-  return $res;
-}
-
-sub which($)
-{
-	my $file = shift;
-	my @path = split ":", $ENV{PATH};
-
-	foreach my $dir(@path) {
-		my $name = $dir.'/'.$file;
-		return $name if (-x $name );
-	}
-	return undef;
-}
-
-#
-# Subroutines that check distro-specific hints
-#
-
-sub give_debian_hints()
-{
-	my %map = (
-		"python-sphinx"		=> "python3-sphinx",
-		"yaml"			=> "python3-yaml",
-		"ensurepip"		=> "python3-venv",
-		"virtualenv"		=> "virtualenv",
-		"dot"			=> "graphviz",
-		"convert"		=> "imagemagick",
-		"Pod::Usage"		=> "perl-modules",
-		"xelatex"		=> "texlive-xetex",
-		"rsvg-convert"		=> "librsvg2-bin",
-	);
-
-	if ($pdf) {
-		check_missing_file(["/usr/share/texlive/texmf-dist/tex/latex/ctex/ctexhook.sty"],
-				   "texlive-lang-chinese", 2);
-
-		check_missing_file(["/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"],
-				   "fonts-dejavu", 2);
-
-		check_missing_file(["/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc",
-				    "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc",
-				    "/usr/share/fonts/opentype/noto/NotoSerifCJK-Regular.ttc"],
-				   "fonts-noto-cjk", 2);
-	}
-
-	check_program("dvipng", 2) if ($pdf);
-	check_missing(\%map);
-
-	return if (!$need && !$optional);
-	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo apt-get install $install\n");
-}
-
-sub give_redhat_hints()
-{
-	my %map = (
-		"python-sphinx"		=> "python3-sphinx",
-		"yaml"			=> "python3-pyyaml",
-		"virtualenv"		=> "python3-virtualenv",
-		"dot"			=> "graphviz",
-		"convert"		=> "ImageMagick",
-		"Pod::Usage"		=> "perl-Pod-Usage",
-		"xelatex"		=> "texlive-xetex-bin",
-		"rsvg-convert"		=> "librsvg2-tools",
-	);
-
-	my @fedora26_opt_pkgs = (
-		"graphviz-gd",		# Fedora 26: needed for PDF support
-	);
-
-	my @fedora_tex_pkgs = (
-		"texlive-collection-fontsrecommended",
-		"texlive-collection-latex",
-		"texlive-xecjk",
-		"dejavu-sans-fonts",
-		"dejavu-serif-fonts",
-		"dejavu-sans-mono-fonts",
-	);
-
-	#
-	# Checks valid for RHEL/CentOS version 7.x.
-	#
-	my $old = 0;
-	my $rel;
-	my $noto_sans_redhat = "google-noto-sans-cjk-ttc-fonts";
-	$rel = $2 if ($system_release =~ /(release|Linux)\s+(\d+)/);
-
-	if (!($system_release =~ /Fedora/)) {
-		$map{"virtualenv"} = "python-virtualenv";
-
-		if ($rel && $rel < 8) {
-			$old = 1;
-			$pdf = 0;
-
-			printf("Note: texlive packages on RHEL/CENTOS <= 7 are incomplete. Can't support PDF output\n");
-			printf("If you want to build PDF, please read:\n");
-			printf("\thttps://www.systutorials.com/241660/how-to-install-tex-live-on-centos-7-linux/\n");
-		}
-	} else {
-		if ($rel && $rel < 26) {
-			$old = 1;
-		}
-		if ($rel && $rel >= 38) {
-			$noto_sans_redhat = "google-noto-sans-cjk-fonts";
-		}
-	}
-	if (!$rel) {
-		printf("Couldn't identify release number\n");
-		$old = 1;
-		$pdf = 0;
-	}
-
-	if ($pdf) {
-		check_missing_file(["/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
-				    "/usr/share/fonts/google-noto-sans-cjk-fonts/NotoSansCJK-Regular.ttc"],
-				   $noto_sans_redhat, 2);
-	}
-
-	check_rpm_missing(\@fedora26_opt_pkgs, 2) if ($pdf && !$old);
-	check_rpm_missing(\@fedora_tex_pkgs, 2) if ($pdf);
-	check_missing_tex(2) if ($pdf);
-	check_missing(\%map);
-
-	return if (!$need && !$optional);
-
-	if (!$old) {
-		# dnf, for Fedora 18+
-		printf("You should run:\n") if ($verbose_warn_install);
-		printf("\n\tsudo dnf install -y $install\n");
-	} else {
-		# yum, for RHEL (and clones) or Fedora version < 18
-		printf("You should run:\n") if ($verbose_warn_install);
-		printf("\n\tsudo yum install -y $install\n");
-	}
-}
-
-sub give_opensuse_hints()
-{
-	my %map = (
-		"python-sphinx"		=> "python3-sphinx",
-		"yaml"			=> "python3-pyyaml",
-		"virtualenv"		=> "python3-virtualenv",
-		"dot"			=> "graphviz",
-		"convert"		=> "ImageMagick",
-		"Pod::Usage"		=> "perl-Pod-Usage",
-		"xelatex"		=> "texlive-xetex-bin",
-	);
-
-	# On Tumbleweed, this package is also named rsvg-convert
-	$map{"rsvg-convert"} = "rsvg-view" if (!($system_release =~ /Tumbleweed/));
-
-	my @suse_tex_pkgs = (
-		"texlive-babel-english",
-		"texlive-caption",
-		"texlive-colortbl",
-		"texlive-courier",
-		"texlive-dvips",
-		"texlive-helvetic",
-		"texlive-makeindex",
-		"texlive-metafont",
-		"texlive-metapost",
-		"texlive-palatino",
-		"texlive-preview",
-		"texlive-times",
-		"texlive-zapfchan",
-		"texlive-zapfding",
-	);
-
-	$map{"latexmk"} = "texlive-latexmk-bin";
-
-	# FIXME: add support for installing CJK fonts
-	#
-	# I tried hard, but was unable to find a way to install
-	# "Noto Sans CJK SC" on openSUSE
-
-	check_rpm_missing(\@suse_tex_pkgs, 2) if ($pdf);
-	check_missing_tex(2) if ($pdf);
-	check_missing(\%map);
-
-	return if (!$need && !$optional);
-	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo zypper install --no-recommends $install\n");
-}
-
-sub give_mageia_hints()
-{
-	my %map = (
-		"python-sphinx"		=> "python3-sphinx",
-		"yaml"			=> "python3-yaml",
-		"virtualenv"		=> "python3-virtualenv",
-		"dot"			=> "graphviz",
-		"convert"		=> "ImageMagick",
-		"Pod::Usage"		=> "perl-Pod-Usage",
-		"xelatex"		=> "texlive",
-		"rsvg-convert"		=> "librsvg2",
-	);
-
-	my @tex_pkgs = (
-		"texlive-fontsextra",
-	);
-
-	$map{"latexmk"} = "texlive-collection-basic";
-
-	my $packager_cmd;
-	my $noto_sans;
-	if ($system_release =~ /OpenMandriva/) {
-		$packager_cmd = "dnf install";
-		$noto_sans = "noto-sans-cjk-fonts";
-		@tex_pkgs = ( "texlive-collection-fontsextra" );
-	} else {
-		$packager_cmd = "urpmi";
-		$noto_sans = "google-noto-sans-cjk-ttc-fonts";
-	}
-
-
-	if ($pdf) {
-		check_missing_file(["/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
-				    "/usr/share/fonts/TTF/NotoSans-Regular.ttf"],
-				   $noto_sans, 2);
-	}
-
-	check_rpm_missing(\@tex_pkgs, 2) if ($pdf);
-	check_missing(\%map);
-
-	return if (!$need && !$optional);
-	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo $packager_cmd $install\n");
-}
-
-sub give_arch_linux_hints()
-{
-	my %map = (
-		"yaml"			=> "python-yaml",
-		"virtualenv"		=> "python-virtualenv",
-		"dot"			=> "graphviz",
-		"convert"		=> "imagemagick",
-		"xelatex"		=> "texlive-xetex",
-		"latexmk"		=> "texlive-core",
-		"rsvg-convert"		=> "extra/librsvg",
-	);
-
-	my @archlinux_tex_pkgs = (
-		"texlive-core",
-		"texlive-latexextra",
-		"ttf-dejavu",
-	);
-	check_pacman_missing(\@archlinux_tex_pkgs, 2) if ($pdf);
-
-	if ($pdf) {
-		check_missing_file(["/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc"],
-				   "noto-fonts-cjk", 2);
-	}
-
-	check_missing(\%map);
-
-	return if (!$need && !$optional);
-	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n\tsudo pacman -S $install\n");
-}
-
-sub give_gentoo_hints()
-{
-	my %map = (
-		"yaml"			=> "dev-python/pyyaml",
-		"virtualenv"		=> "dev-python/virtualenv",
-		"dot"			=> "media-gfx/graphviz",
-		"convert"		=> "media-gfx/imagemagick",
-		"xelatex"		=> "dev-texlive/texlive-xetex media-fonts/dejavu",
-		"rsvg-convert"		=> "gnome-base/librsvg",
-	);
-
-	check_missing_file(["/usr/share/fonts/dejavu/DejaVuSans.ttf"],
-			   "media-fonts/dejavu", 2) if ($pdf);
-
-	if ($pdf) {
-		check_missing_file(["/usr/share/fonts/noto-cjk/NotoSansCJKsc-Regular.otf",
-				    "/usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc"],
-				   "media-fonts/noto-cjk", 2);
-	}
-
-	check_missing(\%map);
-
-	return if (!$need && !$optional);
-
-	printf("You should run:\n") if ($verbose_warn_install);
-	printf("\n");
-
-	my $imagemagick = "media-gfx/imagemagick svg png";
-	my $cairo = "media-gfx/graphviz cairo pdf";
-	my $portage_imagemagick = "/etc/portage/package.use/imagemagick";
-	my $portage_cairo = "/etc/portage/package.use/graphviz";
-
-	if (qx(grep imagemagick $portage_imagemagick 2>/dev/null) eq "") {
-		printf("\tsudo su -c 'echo \"$imagemagick\" > $portage_imagemagick'\n")
-	}
-	if (qx(grep graphviz $portage_cairo 2>/dev/null) eq  "") {
-		printf("\tsudo su -c 'echo \"$cairo\" > $portage_cairo'\n");
-	}
-
-	printf("\tsudo emerge --ask $install\n");
-
-}
-
-sub check_distros()
-{
-	# Distro-specific hints
-	if ($system_release =~ /Red Hat Enterprise Linux/) {
-		give_redhat_hints;
-		return;
-	}
-	if ($system_release =~ /CentOS/) {
-		give_redhat_hints;
-		return;
-	}
-	if ($system_release =~ /Scientific Linux/) {
-		give_redhat_hints;
-		return;
-	}
-	if ($system_release =~ /Oracle Linux Server/) {
-		give_redhat_hints;
-		return;
-	}
-	if ($system_release =~ /Fedora/) {
-		give_redhat_hints;
-		return;
-	}
-	if ($system_release =~ /Ubuntu/) {
-		give_debian_hints;
-		return;
-	}
-	if ($system_release =~ /Debian/) {
-		give_debian_hints;
-		return;
-	}
-	if ($system_release =~ /openSUSE/) {
-		give_opensuse_hints;
-		return;
-	}
-	if ($system_release =~ /Mageia/) {
-		give_mageia_hints;
-		return;
-	}
-	if ($system_release =~ /OpenMandriva/) {
-		give_mageia_hints;
-		return;
-	}
-	if ($system_release =~ /Arch Linux/) {
-		give_arch_linux_hints;
-		return;
-	}
-	if ($system_release =~ /Gentoo/) {
-		give_gentoo_hints;
-		return;
-	}
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
-}
-
-#
-# Common dependencies
-#
-
-sub deactivate_help()
-{
-	printf "\n    If you want to exit the virtualenv, you can use:\n";
-	printf "\tdeactivate\n";
-}
-
-sub get_virtenv()
-{
-	my $ver;
-	my $min_activate = "$ENV{'PWD'}/${virtenv_prefix}${min_version}/bin/activate";
-	my @activates = glob "$ENV{'PWD'}/${virtenv_prefix}*/bin/activate";
-
-	@activates = sort {$b cmp $a} @activates;
-
-	foreach my $f (@activates) {
-		next if ($f lt $min_activate);
-
-		my $sphinx_cmd = $f;
-		$sphinx_cmd =~ s/activate/sphinx-build/;
-		next if (! -f $sphinx_cmd);
-
-		my $ver = get_sphinx_version($sphinx_cmd);
-
-		if (!$ver) {
-			$f =~ s#/bin/activate##;
-			print("Warning: virtual environment $f is not working.\nPython version upgrade? Remove it with:\n\n\trm -rf $f\n\n");
-		}
-
-		if ($need_sphinx && ($ver ge $min_version)) {
-			return ($f, $ver);
-		} elsif ($ver gt $cur_version) {
-			return ($f, $ver);
-		}
-	}
-	return ("", "");
-}
-
-sub recommend_sphinx_upgrade()
-{
-	my $venv_ver;
-
-	# Avoid running sphinx-builds from venv if $cur_version is good
-	if ($cur_version && ($cur_version ge $rec_version)) {
-		$latest_avail_ver = $cur_version;
-		return;
-	}
-
-	# Get the highest version from sphinx_*/bin/sphinx-build and the
-	# corresponding command to activate the venv/virtenv
-	($activate_cmd, $venv_ver) = get_virtenv();
-
-	# Store the highest version from Sphinx existing virtualenvs
-	if (($activate_cmd ne "") && ($venv_ver gt $cur_version)) {
-		$latest_avail_ver = $venv_ver;
-	} else {
-		$latest_avail_ver = $cur_version if ($cur_version);
-	}
-
-	# As we don't know package version of Sphinx, and there's no
-	# virtual environments, don't check if upgrades are needed
-	if (!$virtualenv) {
-		return if (!$latest_avail_ver);
-	}
-
-	# Either there are already a virtual env or a new one should be created
-	$need_pip = 1;
-
-	return if (!$latest_avail_ver);
-
-	# Return if the reason is due to an upgrade or not
-	if ($latest_avail_ver lt $rec_version) {
-		$rec_sphinx_upgrade = 1;
-	}
-
-	return $latest_avail_ver;
-}
-
-#
-# The logic here is complex, as it have to deal with different versions:
-#	- minimal supported version;
-#	- minimal PDF version;
-#	- recommended version.
-# It also needs to work fine with both distro's package and venv/virtualenv
-sub recommend_sphinx_version($)
-{
-	my $virtualenv_cmd = shift;
-
-	# Version is OK. Nothing to do.
-	if ($cur_version && ($cur_version ge $rec_version)) {
-		return;
-	};
-
-	if (!$need_sphinx) {
-		# sphinx-build is present and its version is >= $min_version
-
-		#only recommend enabling a newer virtenv version if makes sense.
-		if ($latest_avail_ver gt $cur_version) {
-			printf "\nYou may also use the newer Sphinx version $latest_avail_ver with:\n";
-			printf "\tdeactivate\n"  if ($ENV{'PWD'} =~ /${virtenv_prefix}/);
-			printf "\t. $activate_cmd\n";
-			deactivate_help();
-
-			return;
-		}
-		return if ($latest_avail_ver ge $rec_version);
-	}
-
-	if (!$virtualenv) {
-		# No sphinx either via package or via virtenv. As we can't
-		# Compare the versions here, just return, recommending the
-		# user to install it from the package distro.
-		return if (!$latest_avail_ver);
-
-		# User doesn't want a virtenv recommendation, but he already
-		# installed one via virtenv with a newer version.
-		# So, print commands to enable it
-		if ($latest_avail_ver gt $cur_version) {
-			printf "\nYou may also use the Sphinx virtualenv version $latest_avail_ver with:\n";
-			printf "\tdeactivate\n"  if ($ENV{'PWD'} =~ /${virtenv_prefix}/);
-			printf "\t. $activate_cmd\n";
-			deactivate_help();
-
-			return;
-		}
-		print "\n";
-	} else {
-		$need++ if ($need_sphinx);
-	}
-
-	# Suggest newer versions if current ones are too old
-	if ($latest_avail_ver && $latest_avail_ver ge $min_version) {
-		# If there's a good enough version, ask the user to enable it
-		if ($latest_avail_ver ge $rec_version) {
-			printf "\nNeed to activate Sphinx (version $latest_avail_ver) on virtualenv with:\n";
-			printf "\t. $activate_cmd\n";
-			deactivate_help();
-
-			return;
-		}
-
-		# Version is above the minimal required one, but may be
-		# below the recommended one. So, print warnings/notes
-
-		if ($latest_avail_ver lt $rec_version) {
-			print "Warning: It is recommended at least Sphinx version $rec_version.\n";
-		}
-	}
-
-	# At this point, either it needs Sphinx or upgrade is recommended,
-	# both via pip
-
-	if ($rec_sphinx_upgrade) {
-		if (!$virtualenv) {
-			print "Instead of install/upgrade Python Sphinx pkg, you could use pip/pypi with:\n\n";
-		} else {
-			print "To upgrade Sphinx, use:\n\n";
-		}
-	} else {
-		print "\nSphinx needs to be installed either:\n1) via pip/pypi with:\n\n";
-	}
-
-	$python_cmd = find_python_no_venv();
-
-	printf "\t$virtualenv_cmd $virtenv_dir\n";
-
-	printf "\t. $virtenv_dir/bin/activate\n";
-	printf "\tpip install -r $requirement_file\n";
-	deactivate_help();
-
-	printf "\n2) As a package with:\n";
-
-	my $old_need = $need;
-	my $old_optional = $optional;
-	%missing = ();
-	$pdf = 0;
-	$optional = 0;
-	$install = "";
-	$verbose_warn_install = 0;
-
-	add_package("python-sphinx", 0);
-
-	check_distros();
-
-	$need = $old_need;
-	$optional = $old_optional;
-
-	printf "\n    Please note that Sphinx >= 3.0 will currently produce false-positive\n";
-	printf "   warning when the same name is used for more than one type (functions,\n";
-	printf "   structs, enums,...). This is known Sphinx bug. For more details, see:\n";
-	printf "\thttps://github.com/sphinx-doc/sphinx/pull/8313\n";
-}
-
-sub check_needs()
-{
-	# Check if Sphinx is already accessible from current environment
-	check_sphinx();
-
-	if ($system_release) {
-		print "Detected OS: $system_release.\n";
-	} else {
-		print "Unknown OS\n";
-	}
-	printf "Sphinx version: %s\n\n", $cur_version if ($cur_version);
-
-	# Check python command line, trying first python3
-	$python_cmd = findprog("python3");
-	$python_cmd = check_program("python", 0) if (!$python_cmd);
-
-	# Check the type of virtual env, depending on Python version
-	if ($python_cmd) {
-		if ($virtualenv) {
-			my $tmp = qx($python_cmd --version 2>&1);
-			if ($tmp =~ m/(\d+\.)(\d+\.)/) {
-				if ($1 < 3) {
-					# Fail if it finds python2 (or worse)
-					die "Python 3 is required to build the kernel docs\n";
-				}
-				if ($1 == 3 && $2 < 3) {
-					# Need Python 3.3 or upper for venv
-					$need_virtualenv = 1;
-				}
-			} else {
-				die "Warning: couldn't identify $python_cmd version!";
-			}
-		} else {
-			add_package("python-sphinx", 0);
-		}
-	}
-
-	my $venv_ver = recommend_sphinx_upgrade();
-
-	my $virtualenv_cmd;
-
-	if ($need_pip) {
-		# Set virtualenv command line, if python < 3.3
-		if ($need_virtualenv) {
-			$virtualenv_cmd = findprog("virtualenv-3");
-			$virtualenv_cmd = findprog("virtualenv-3.5") if (!$virtualenv_cmd);
-			if (!$virtualenv_cmd) {
-				check_program("virtualenv", 0);
-				$virtualenv_cmd = "virtualenv";
-			}
-		} else {
-			$virtualenv_cmd = "$python_cmd -m venv";
-			check_python_module("ensurepip", 0);
-		}
-	}
-
-	# Check for needed programs/tools
-	check_perl_module("Pod::Usage", 0);
-	check_python_module("yaml", 0);
-	check_program("make", 0);
-	check_program("gcc", 0);
-	check_program("dot", 1);
-	check_program("convert", 1);
-
-	# Extra PDF files - should use 2 for is_optional
-	check_program("xelatex", 2) if ($pdf);
-	check_program("rsvg-convert", 2) if ($pdf);
-	check_program("latexmk", 2) if ($pdf);
-
-	# Do distro-specific checks and output distro-install commands
-	check_distros();
-
-	if (!$python_cmd) {
-		if ($need == 1) {
-			die "Can't build as $need mandatory dependency is missing";
-		} elsif ($need) {
-			die "Can't build as $need mandatory dependencies are missing";
-		}
-	}
-
-	# Check if sphinx-build is called sphinx-build-3
-	if ($need_symlink) {
-		printf "\tsudo ln -sf %s /usr/bin/sphinx-build\n\n",
-		       which("sphinx-build-3");
-	}
-
-	recommend_sphinx_version($virtualenv_cmd);
-	printf "\n";
-
-	print "All optional dependencies are met.\n" if (!$optional);
-
-	if ($need == 1) {
-		die "Can't build as $need mandatory dependency is missing";
-	} elsif ($need) {
-		die "Can't build as $need mandatory dependencies are missing";
-	}
-
-	print "Needed package dependencies are met.\n";
-}
-
-#
-# Main
-#
-
-while (@ARGV) {
-	my $arg = shift(@ARGV);
-
-	if ($arg eq "--no-virtualenv") {
-		$virtualenv = 0;
-	} elsif ($arg eq "--no-pdf"){
-		$pdf = 0;
-	} elsif ($arg eq "--version-check"){
-		$version_check = 1;
-	} else {
-		print "Usage:\n\t$0 <--no-virtualenv> <--no-pdf> <--version-check>\n\n";
-		print "Where:\n";
-		print "\t--no-virtualenv\t- Recommend installing Sphinx instead of using a virtualenv\n";
-		print "\t--version-check\t- if version is compatible, don't check for missing dependencies\n";
-		print "\t--no-pdf\t- don't check for dependencies required to build PDF docs\n\n";
-		exit -1;
-	}
-}
-
-#
-# Determine the system type. There's no standard unique way that would
-# work with all distros with a minimal package install. So, several
-# methods are used here.
-#
-# By default, it will use lsb_release function. If not available, it will
-# fail back to reading the known different places where the distro name
-# is stored
-#
-
-$system_release = qx(lsb_release -d) if which("lsb_release");
-$system_release =~ s/Description:\s*// if ($system_release);
-$system_release = catcheck("/etc/system-release") if !$system_release;
-$system_release = catcheck("/etc/redhat-release") if !$system_release;
-$system_release = catcheck("/etc/lsb-release") if !$system_release;
-$system_release = catcheck("/etc/gentoo-release") if !$system_release;
-
-# This seems more common than LSB these days
-if (!$system_release) {
-	my %os_var;
-	if (open IN, "cat /etc/os-release|") {
-		while (<IN>) {
-			if (m/^([\w\d\_]+)=\"?([^\"]*)\"?\n/) {
-				$os_var{$1}=$2;
-			}
-		}
-		$system_release = $os_var{"NAME"};
-		if (defined($os_var{"VERSION_ID"})) {
-			$system_release .= " " . $os_var{"VERSION_ID"} if (defined($os_var{"VERSION_ID"}));
-		} else {
-			$system_release .= " " . $os_var{"VERSION"};
-		}
-	}
-}
-$system_release = catcheck("/etc/issue") if !$system_release;
-$system_release =~ s/\s+$//;
-
-check_needs;
+    return tuple(int(x) for x in version.split("."))
+
+
+def ver_str(version):
+    """Returns a version tuple as major.minor.patch"""
+
+    return ".".join([str(x) for x in version])
+
+
+RECOMMENDED_VERSION = parse_version("3.4.3")
+
+
+class SphinxDependencyChecker:
+    # List of required texlive packages on Fedora and OpenSuse
+    texlive = {
+        "amsfonts.sty":       "texlive-amsfonts",
+        "amsmath.sty":        "texlive-amsmath",
+        "amssymb.sty":        "texlive-amsfonts",
+        "amsthm.sty":         "texlive-amscls",
+        "anyfontsize.sty":    "texlive-anyfontsize",
+        "atbegshi.sty":       "texlive-oberdiek",
+        "bm.sty":             "texlive-tools",
+        "capt-of.sty":        "texlive-capt-of",
+        "cmap.sty":           "texlive-cmap",
+        "ctexhook.sty":       "texlive-ctex",
+        "ecrm1000.tfm":       "texlive-ec",
+        "eqparbox.sty":       "texlive-eqparbox",
+        "eu1enc.def":         "texlive-euenc",
+        "fancybox.sty":       "texlive-fancybox",
+        "fancyvrb.sty":       "texlive-fancyvrb",
+        "float.sty":          "texlive-float",
+        "fncychap.sty":       "texlive-fncychap",
+        "footnote.sty":       "texlive-mdwtools",
+        "framed.sty":         "texlive-framed",
+        "luatex85.sty":       "texlive-luatex85",
+        "multirow.sty":       "texlive-multirow",
+        "needspace.sty":      "texlive-needspace",
+        "palatino.sty":       "texlive-psnfss",
+        "parskip.sty":        "texlive-parskip",
+        "polyglossia.sty":    "texlive-polyglossia",
+        "tabulary.sty":       "texlive-tabulary",
+        "threeparttable.sty": "texlive-threeparttable",
+        "titlesec.sty":       "texlive-titlesec",
+        "ucs.sty":            "texlive-ucs",
+        "upquote.sty":        "texlive-upquote",
+        "wrapfig.sty":        "texlive-wrapfig",
+    }
+
+    def __init__(self, args):
+        self.pdf = args.pdf
+        self.virtualenv = args.virtualenv
+        self.version_check = args.version_check
+
+        self.missing = {}
+
+        self.need = 0
+        self.optional = 0
+        self.need_symlink = 0
+        self.need_sphinx = 0
+        self.need_pip = 0
+        self.need_virtualenv = 0
+        self.rec_sphinx_upgrade = 0
+        self.verbose_warn_install = 1
+
+        self.system_release = ""
+        self.install = ""
+        self.virtenv_dir = ""
+        self.python_cmd = ""
+        self.activate_cmd = ""
+
+        self.min_version = (0, 0, 0)
+        self.cur_version = (0, 0, 0)
+        self.latest_avail_ver = (0, 0, 0)
+        self.venv_ver = (0, 0, 0)
+
+        prefix = os.environ.get("srctree", ".") + "/"
+
+        self.conf = prefix + "Documentation/conf.py"
+        self.requirement_file = prefix + "Documentation/sphinx/requirements.txt"
+        self.virtenv_prefix = ["sphinx_", "Sphinx_" ]
+
+    #
+    # Ancillary methods that don't depend on self
+    #
+
+    @staticmethod
+    def which(prog):
+        for path in os.environ.get("PATH", "").split(":"):
+            full_path = os.path.join(path, prog)
+            if os.access(full_path, os.X_OK):
+                return full_path
+
+        return None
+
+    @staticmethod
+    def find_python_no_venv():
+        # FIXME: does it makes sense now that this script is in Python?
+
+        result = subprocess.run(["pwd"], capture_output=True, text=True)
+        cur_dir = result.stdout.strip()
+
+        python_names = ["python3", "python"]
+
+        for d in os.environ.get("PATH", "").split(":"):
+            if f"{cur_dir}/sphinx" in d:
+                continue
+
+            for p in python_names:
+                if os.access(os.path.join(d, p), os.X_OK):
+                    return os.path.join(d, p)
+
+        # Python not found at the PATH
+        return python_names[-1]
+
+    @staticmethod
+    def run(*args, **kwargs):
+        """Excecute a command, hiding its output by default"""
+
+        if not kwargs.get('capture_output', False):
+            if 'stdout' not in kwargs:
+                kwargs['stdout'] = subprocess.DEVNULL
+            if 'stderr' not in kwargs:
+                kwargs['stderr'] = subprocess.DEVNULL
+
+        return subprocess.run(*args, **kwargs)
+
+    #
+    # Methods to check if a feature exists
+    #
+
+    # Note: is_optional has 3 states:
+    #   - 0: mandatory
+    #   - 1: optional, but nice to have
+    #   - 2: LaTeX optional - pdf builds without it, but may have visual impact
+
+    def check_missing(self, progs):
+        for prog, is_optional in sorted(self.missing.items()):
+            # At least on some LTS distros like CentOS 7, texlive doesn't
+            # provide all packages we need. When such distros are
+            # detected, we have to disable PDF output.
+            #
+            # So, we need to ignore the packages that distros would
+            # need for LaTeX to work
+            if is_optional == 2 and not self.pdf:
+                self.optional -= 1
+                continue
+
+            if self.verbose_warn_install:
+                if is_optional:
+                    print(f'Warning: better to also install "{prog}".')
+                else:
+                    print(f'ERROR: please install "{prog}", otherwise, build won\'t work.')
+
+            self.install += " " + progs.get(prog, prog)
+
+        self.install = self.install.lstrip()
+
+    def add_package(self, package, is_optional):
+        self.missing[package] = is_optional
+        if is_optional:
+            self.optional += 1
+        else:
+            self.need += 1
+
+    def check_missing_file(self, files, package, is_optional):
+        for f in files:
+            if os.path.exists(f):
+                return
+        self.add_package(package, is_optional)
+
+    def check_program(self, prog, is_optional):
+        found = self.which(prog)
+        if found:
+            return found
+
+        self.add_package(prog, is_optional)
+
+        return None
+
+    def check_perl_module(self, prog, is_optional):
+        # While testing with lxc download template, one of the
+        # distros (Oracle) didn't have perl - nor even an option to install
+        # before installing oraclelinux-release-el9 package.
+        #
+        # Check it before running an error. If perl is not there,
+        # add it as a mandatory package, as some parts of the doc builder
+        # needs it.
+        if not self.which("perl"):
+            self.add_package("perl", 0)
+            self.add_package(prog, is_optional)
+            return
+
+        try:
+            self.run(["perl", f"-M{prog}", "-e", "1"], check=True)
+        except subprocess.CalledProcessError:
+            self.add_package(prog, is_optional)
+
+    def check_python_module(self, module, is_optional):
+        # FIXME: is it needed at the Python version? Maybe due to venv?
+        if not self.python_cmd:
+            return
+
+        try:
+            self.run([self.python_cmd, "-c", f"import {module}"], check=True)
+        except subprocess.CalledProcessError:
+            self.add_package(module, is_optional)
+
+    def check_rpm_missing(self, pkgs, is_optional):
+        for prog in pkgs:
+            try:
+                self.run(["rpm", "-q", prog], check=True)
+            except subprocess.CalledProcessError:
+                self.add_package(prog, is_optional)
+
+    def check_pacman_missing(self, pkgs, is_optional):
+        for prog in pkgs:
+            try:
+                self.run(["pacman", "-Q", prog], check=True)
+            except subprocess.CalledProcessError:
+                self.add_package(prog, is_optional)
+
+    def check_missing_tex(self, is_optional):
+        kpsewhich = self.which("kpsewhich")
+        for prog, package in self.texlive.items():
+
+            # If kpsewhich is not there, just add it to deps
+            if not kpsewhich:
+                self.add_package(package, is_optional)
+                continue
+
+            # Check if the package is needed
+            try:
+                result = self.run(
+                    [kpsewhich, prog], stdout=subprocess.PIPE, text=True, check=True
+                )
+
+                # Didn't find. Add it
+                if not result.stdout.strip():
+                    self.add_package(package, is_optional)
+
+            except subprocess.CalledProcessError:
+                # kpsewhich returned an error. Add it, just in case
+                self.add_package(package, is_optional)
+
+    def get_sphinx_fname(self):
+        if "SPHINXBUILD" in os.environ:
+            return os.environ["SPHINXBUILD"]
+
+        fname = "sphinx-build"
+        if self.which(fname):
+            return fname
+
+        fname = "sphinx-build-3"
+        if self.which(fname):
+            self.need_symlink = 1
+            return fname
+
+        return ""
+
+    def get_sphinx_version(self, cmd):
+        try:
+            result = self.run([cmd, "--version"],
+                              stdout=subprocess.PIPE,
+                              stderr=subprocess.STDOUT,
+                              text=True, check=True)
+        except (subprocess.CalledProcessError, FileNotFoundError):
+            return None
+
+        for line in result.stdout.split("\n"):
+            match = re.match(r"^sphinx-build\s+([\d\.]+)(?:\+(?:/[\da-f]+)|b\d+)?\s*$", line)
+            if match:
+                return parse_version(m1.group(1))
+
+            match = re.match(r"^Sphinx.*\s+([\d\.]+)\s*$", line)
+            if match:
+                return parse_version(m2.group(1))
+
+    def check_sphinx(self):
+        try:
+            with open(self.conf, "r", encoding="utf-8") as f:
+                for line in f:
+                    match = re.match(r"^\s*needs_sphinx\s*=\s*[\'\"]([\d\.]+)[\'\"]", line)
+                    if match:
+                        self.min_version = parse_version(match.group(1))
+                        break
+        except IOError:
+            sys.exit(f"Can't open {self.conf}")
+
+        if not self.min_version:
+            sys.exit(f"Can't get needs_sphinx version from {self.conf}")
+
+        self.virtenv_dir = self.virtenv_prefix[0] + "latest"
+
+        sphinx = self.get_sphinx_fname()
+        if not sphinx:
+            self.need_sphinx = 1
+            return
+
+        self.cur_version = self.get_sphinx_version(sphinx)
+        if not self.cur_version:
+            sys.exit(f"{sphinx} didn't return its version")
+
+        if self.cur_version < self.min_version:
+            curver = ver_str(self.cur_version)
+            minver = ver_str(self.min_version)
+
+            print(f"ERROR: Sphinx version is {curver}. It should be >= {minver}")
+            self.need_sphinx = 1
+            return
+
+        # On version check mode, just assume Sphinx has all mandatory deps
+        if self.version_check and self.cur_version >= RECOMMENDED_VERSION:
+            sys.exit(0)
+
+    def catcheck(self, filename):
+        if os.path.exists(filename):
+            with open(filename, "r", encoding="utf-8") as f:
+                return f.read().strip()
+        return ""
+
+    #
+    # Distro-specific hints methods
+    #
+
+    def give_debian_hints(self):
+        progs = {
+            "Pod::Usage":    "perl-modules",
+            "convert":       "imagemagick",
+            "dot":           "graphviz",
+            "ensurepip":     "python3-venv",
+            "python-sphinx": "python3-sphinx",
+            "rsvg-convert":  "librsvg2-bin",
+            "virtualenv":    "virtualenv",
+            "xelatex":       "texlive-xetex",
+            "yaml":          "python3-yaml",
+        }
+
+        if self.pdf:
+            pdf_pkgs = {
+                "texlive-lang-chinese": [
+                    "/usr/share/texlive/texmf-dist/tex/latex/ctex/ctexhook.sty",
+                ],
+                "fonts-dejavu": [
+                    "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
+                ],
+                "fonts-noto-cjk": [
+                    "/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc",
+                    "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc",
+                    "/usr/share/fonts/opentype/noto/NotoSerifCJK-Regular.ttc",
+                ],
+            }
+
+            for package, files in pdf_pkgs.items():
+                self.check_missing_file(files, package, 2)
+
+            self.check_program("dvipng", 2)
+
+        self.check_missing(progs)
+
+        if not self.need and not self.optional:
+            return
+
+        if self.verbose_warn_install:
+            print("You should run:")
+        print(f"\n\tsudo apt-get install {self.install}")
+
+    def give_redhat_hints(self):
+        progs = {
+            "Pod::Usage":       "perl-Pod-Usage",
+            "convert":          "ImageMagick",
+            "dot":              "graphviz",
+            "python-sphinx":    "python3-sphinx",
+            "rsvg-convert":     "librsvg2-tools",
+            "virtualenv":       "python3-virtualenv",
+            "xelatex":          "texlive-xetex-bin",
+            "yaml":             "python3-pyyaml",
+        }
+
+        fedora26_opt_pkgs = [
+            "graphviz-gd",  # Fedora 26: needed for PDF support
+        ]
+
+        fedora_tex_pkgs = [
+            "dejavu-sans-fonts",
+            "dejavu-sans-mono-fonts",
+            "dejavu-serif-fonts",
+            "texlive-collection-fontsrecommended",
+            "texlive-collection-latex",
+            "texlive-xecjk",
+        ]
+
+        old = 0
+        rel = None
+        pkg_manager = "dnf"
+
+        match = re.search(r"(release|Linux)\s+(\d+)", self.system_release)
+        if match:
+            rel = int(match.group(2))
+
+        if not rel:
+            print("Couldn't identify release number")
+            old = 1
+            self.pdf = False
+        elif re.search("Fedora", self.system_release):
+            # Fedora 38 and upper use this CJK font
+
+            noto_sans_redhat = "google-noto-sans-cjk-fonts"
+        else:
+            # Almalinux, CentOS, RHEL, ...
+
+            # at least up to version 9 (and Fedora < 38), that's the CJK font
+            noto_sans_redhat = "google-noto-sans-cjk-ttc-fonts"
+
+            progs["virtualenv"] = "python-virtualenv"
+
+            if rel and rel < 8:
+                old = 1
+                self.pdf = False
+
+                # RHEL 7 is in ELS, currently up to Jun, 2026
+
+                print("Note: texlive packages on RHEL/CENTOS <= 7 are incomplete. Can't support PDF output")
+                print("If you want to build PDF, please read:")
+                print("\thttps://www.systutorials.com/241660/how-to-install-tex-live-on-centos-7-linux/")
+
+        if self.pdf:
+            pdf_pkgs = [
+                "/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
+                "/usr/share/fonts/google-noto-sans-cjk-fonts/NotoSansCJK-Regular.ttc",
+            ]
+
+            self.check_missing_file(pdf_pkgs, noto_sans_redhat, 2)
+
+            if not old:
+                self.check_rpm_missing(fedora26_opt_pkgs, 2)
+                self.check_rpm_missing(fedora_tex_pkgs, 2)
+
+            self.check_missing_tex(2)
+
+        self.check_missing(progs)
+
+        if not self.need and not self.optional:
+            return
+
+        if self.verbose_warn_install:
+            print("You should run:")
+
+        if old:
+            # dnf is there since Fedora 18+ and RHEL 8
+            pkg_manager = "yum"
+
+        print(f"\n\tsudo {pkg_manager} install -y {self.install}")
+
+    def give_opensuse_hints(self):
+        progs = {
+            "Pod::Usage":    "perl-Pod-Usage",
+            "convert":       "ImageMagick",
+            "dot":           "graphviz",
+            "python-sphinx": "python3-sphinx",
+            "virtualenv":    "python3-virtualenv",
+            "xelatex":       "texlive-xetex-bin",
+            "yaml":          "python3-pyyaml",
+        }
+
+        # On Tumbleweed, this package is also named rsvg-convert
+        if not re.search(r"Tumbleweed", self.system_release):
+            progs["rsvg-convert"] = "rsvg-view"
+
+        suse_tex_pkgs = [
+            "texlive-babel-english",
+            "texlive-caption",
+            "texlive-colortbl",
+            "texlive-courier",
+            "texlive-dvips",
+            "texlive-helvetic",
+            "texlive-makeindex",
+            "texlive-metafont",
+            "texlive-metapost",
+            "texlive-palatino",
+            "texlive-preview",
+            "texlive-times",
+            "texlive-zapfchan",
+            "texlive-zapfding",
+        ]
+
+        progs["latexmk"] = "texlive-latexmk-bin"
+
+        # FIXME: add support for installing CJK fonts
+        #
+        # I tried hard, but was unable to find a way to install
+        # "Noto Sans CJK SC" on openSUSE
+
+        if self.pdf:
+            self.check_rpm_missing(suse_tex_pkgs, 2)
+        if self.pdf:
+            self.check_missing_tex(2)
+        self.check_missing(progs)
+
+        if not self.need and not self.optional:
+            return
+
+        if self.verbose_warn_install:
+            print("You should run:")
+        print(f"\n\tsudo zypper install --no-recommends {self.install}")
+
+    def give_mageia_hints(self):
+        progs = {
+            "Pod::Usage":    "perl-Pod-Usage",
+            "convert":       "ImageMagick",
+            "dot":           "graphviz",
+            "python-sphinx": "python3-sphinx",
+            "rsvg-convert":  "librsvg2",
+            "virtualenv":    "python3-virtualenv",
+            "xelatex":       "texlive",
+            "yaml":          "python3-yaml",
+        }
+
+        tex_pkgs = [
+            "texlive-fontsextra",
+        ]
+
+        if re.search(r"OpenMandriva", self.system_release):
+            packager_cmd = "dnf install"
+            noto_sans = "noto-sans-cjk-fonts"
+            tex_pkgs = ["texlive-collection-fontsextra"]
+        else:
+            packager_cmd = "urpmi"
+            noto_sans = "google-noto-sans-cjk-ttc-fonts"
+
+        progs["latexmk"] = "texlive-collection-basic"
+
+        if self.pdf:
+            pdf_pkgs = [
+                "/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
+                "/usr/share/fonts/TTF/NotoSans-Regular.ttf",
+            ]
+
+            self.check_missing_file(pdf_pkgs, noto_sans, 2)
+            self.check_rpm_missing(tex_pkgs, 2)
+
+        self.check_missing(progs)
+
+        if not self.need and not self.optional:
+            return
+        if self.verbose_warn_install:
+            print("You should run:")
+        print(f"\n\tsudo {packager_cmd} {self.install}")
+
+    def give_arch_linux_hints(self):
+        progs = {
+            "convert":      "imagemagick",
+            "dot":          "graphviz",
+            "latexmk":      "texlive-core",
+            "rsvg-convert": "extra/librsvg",
+            "virtualenv":   "python-virtualenv",
+            "xelatex":      "texlive-xetex",
+            "yaml":         "python-yaml",
+        }
+
+        archlinux_tex_pkgs = [
+            "texlive-core",
+            "texlive-latexextra",
+            "ttf-dejavu",
+        ]
+
+        if self.pdf:
+            self.check_pacman_missing(archlinux_tex_pkgs, 2)
+
+            self.check_missing_file(
+                ["/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc"],
+                "noto-fonts-cjk",
+                2,
+            )
+
+        self.check_missing(progs)
+
+        if not self.need and not self.optional:
+            return
+        if self.verbose_warn_install:
+            print("You should run:")
+        print(f"\n\tsudo pacman -S {self.install}")
+
+    def give_gentoo_hints(self):
+        progs = {
+            "convert":      "media-gfx/imagemagick",
+            "dot":          "media-gfx/graphviz",
+            "rsvg-convert": "gnome-base/librsvg",
+            "virtualenv":   "dev-python/virtualenv",
+            "xelatex":      "dev-texlive/texlive-xetex media-fonts/dejavu",
+            "yaml":         "dev-python/pyyaml",
+        }
+
+        if self.pdf:
+            pdf_pkgs = {
+                "media-fonts/dejavu": [
+                    "/usr/share/fonts/dejavu/DejaVuSans.ttf",
+                ],
+                "media-fonts/noto-cjk": [
+                    "/usr/share/fonts/noto-cjk/NotoSansCJKsc-Regular.otf",
+                    "/usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc",
+                ],
+            }
+            for package, files in pdf_pkgs.items():
+                self.check_missing_file(files, package, 2)
+
+        self.check_missing(progs)
+
+        if not self.need and not self.optional:
+            return
+
+        if self.verbose_warn_install:
+            print("You should run:")
+        print("\n")
+
+        imagemagick = "media-gfx/imagemagick svg png"
+        cairo = "media-gfx/graphviz cairo pdf"
+        portage_imagemagick = "/etc/portage/package.use/imagemagick"
+        portage_cairo = "/etc/portage/package.use/graphviz"
+
+        result = self.run(["grep", "imagemagick", portage_imagemagick],
+                          stdout=subprocess.PIPE, text=True)
+        if not result.stdout.strip():
+            print(f"\tsudo su -c 'echo \"{imagemagick}\" > {portage_imagemagick}'")
+
+        result = self.run(["grep", "graphviz", portage_cairo],
+                          stdout=subprocess.PIPE, text=True)
+
+        if not result.stdout.strip():
+            print(f"\tsudo su -c 'echo \"{cairo}\" > {portage_cairo}'")
+
+        print(f"\tsudo emerge --ask {self.install}")
+
+    #
+    # Dispatch the check to an os_specific hinter
+    #
+
+    def check_distros(self):
+        # OS-specific hints logic
+        os_hints = {
+            re.compile("Red Hat Enterprise Linux"):   self.give_redhat_hints,
+            re.compile("Fedora"):                     self.give_redhat_hints,
+            re.compile("AlmaLinux"):                  self.give_redhat_hints,
+            re.compile("Amazon Linux"):               self.give_redhat_hints,
+            re.compile("CentOS"):                     self.give_redhat_hints,
+            re.compile("openEuler"):                  self.give_redhat_hints,
+            re.compile("Oracle Linux Server"):        self.give_redhat_hints,
+            re.compile("Rocky Linux"):                self.give_redhat_hints,
+            re.compile("Scientific Linux"):           self.give_redhat_hints,
+            re.compile("Springdale Open Enterprise"): self.give_redhat_hints,
+
+            re.compile("Ubuntu"):                     self.give_debian_hints,
+            re.compile("Debian"):                     self.give_debian_hints,
+            re.compile("Devuan"):                     self.give_debian_hints,
+            re.compile("Kali"):                       self.give_debian_hints,
+            re.compile("Mint"):                       self.give_debian_hints,
+
+            re.compile("openSUSE"):                   self.give_opensuse_hints,
+
+            re.compile("Mageia"):                     self.give_mageia_hints,
+            re.compile("OpenMandriva"):               self.give_mageia_hints,
+
+            re.compile("Arch Linux"):                 self.give_arch_linux_hints,
+            re.compile("Gentoo"):                     self.give_gentoo_hints,
+        }
+
+        # If the OS is detected, use per-OS hint logic
+        for regex, os_hint in os_hints.items():
+            if regex.search(self.system_release):
+                os_hint()
+
+                return
+
+        #
+        # Fall-back to generic hint code for other distros
+        # That's far from ideal, specially for LaTeX dependencies.
+        #
+        progs = {"sphinx-build": "sphinx"}
+        if self.pdf:
+            self.check_missing_tex(2)
+
+        self.check_missing(progs)
+
+        print(f"I don't know distro {self.system_release}.")
+        print("So, I can't provide you a hint with the install procedure.")
+        print("There are likely missing dependencies.")
+
+    #
+    # Common dependencies
+    #
+    def deactivate_help(self):
+        print("\n    If you want to exit the virtualenv, you can use:")
+        print("\tdeactivate")
+
+    def get_virtenv(self):
+        cwd = os.getcwd()
+
+        activates = []
+
+        # Add all sphinx prefixes with possible version numbers
+        for p in self.virtenv_prefix:
+            activates += glob(f"{cwd}/{p}[0-9]*/bin/activate")
+
+        activates.sort(reverse=True, key=str.lower)
+
+        # Place sphinx_latest first, if it exists
+        for p in self.virtenv_prefix:
+            activates = glob(f"{cwd}/{p}*latest/bin/activate") + activates
+
+        ver = (0, 0, 0)
+        for f in activates:
+            # Discard too old Sphinx virtual environments
+            match = re.search(r"(\d+)\.(\d+)\.(\d+)", f)
+            if match:
+                ver = (int(match.group(1)), int(match.group(2)), int(match.group(3)))
+
+                if ver < self.min_version:
+                    continue
+
+            sphinx_cmd = f.replace("activate", "sphinx-build")
+            if not os.path.isfile(sphinx_cmd):
+                continue
+
+            ver = self.get_sphinx_version(sphinx_cmd)
+
+            if not ver:
+                venv_dir = f.replace("/bin/activate", "")
+                print(f"Warning: virtual environment {venv_dir} is not working.\n" \
+                      "Python version upgrade? Remove it with:\n\n" \
+                      "\trm -rf {venv_dir}\n\n")
+            else:
+                if self.need_sphinx and ver >= self.min_version:
+                    return (f, ver)
+                elif parse_version(ver) > self.cur_version:
+                    return (f, ver)
+
+        return ("", ver)
+
+    def recommend_sphinx_upgrade(self):
+        # Avoid running sphinx-builds from venv if cur_version is good
+        if self.cur_version and self.cur_version >= RECOMMENDED_VERSION:
+            self.latest_avail_ver = self.cur_version
+            return None
+
+        # Get the highest version from sphinx_*/bin/sphinx-build and the
+        # corresponding command to activate the venv/virtenv
+        self.activate_cmd, self.venv_ver = self.get_virtenv()
+
+        # Store the highest version from Sphinx existing virtualenvs
+        if self.activate_cmd and self.venv_ver > self.cur_version:
+            self.latest_avail_ver = self.venv_ver
+        else:
+            if self.cur_version:
+                self.latest_avail_ver = self.cur_version
+            else:
+                self.latest_avail_ver = (0, 0, 0)
+
+        # As we don't know package version of Sphinx, and there's no
+        # virtual environments, don't check if upgrades are needed
+        if not self.virtualenv:
+            if not self.latest_avail_ver:
+                return None
+
+            return self.latest_avail_ver
+
+        # Either there are already a virtual env or a new one should be created
+        self.need_pip = 1
+
+        if not self.latest_avail_ver:
+            return None
+
+        # Return if the reason is due to an upgrade or not
+        if self.latest_avail_ver != (0, 0, 0):
+            if self.latest_avail_ver < RECOMMENDED_VERSION:
+                self.rec_sphinx_upgrade = 1
+
+        return self.latest_avail_ver
+
+    def recommend_sphinx_version(self, virtualenv_cmd):
+        # The logic here is complex, as it have to deal with different versions:
+        #	- minimal supported version;
+        #	- minimal PDF version;
+        #	- recommended version.
+        # It also needs to work fine with both distro's package and venv/virtualenv
+
+        # Version is OK. Nothing to do.
+        if self.cur_version != (0, 0, 0) and self.cur_version >= RECOMMENDED_VERSION:
+            return
+
+        if not self.need_sphinx:
+            # sphinx-build is present and its version is >= $min_version
+
+            # only recommend enabling a newer virtenv version if makes sense.
+            if self.latest_avail_ver and self.latest_avail_ver > self.cur_version:
+                print("\nYou may also use the newer Sphinx version {self.latest_avail_ver} with:")
+                if f"{self.virtenv_prefix}" in os.getcwd():
+                    print("\tdeactivate")
+                print(f"\t. {self.activate_cmd}")
+                self.deactivate_help()
+                return
+
+            if self.latest_avail_ver and self.latest_avail_ver >= RECOMMENDED_VERSION:
+                return
+
+        if not self.virtualenv:
+            # No sphinx either via package or via virtenv. As we can't
+            # Compare the versions here, just return, recommending the
+            # user to install it from the package distro.
+            if not self.latest_avail_ver or self.latest_avail_ver == (0, 0, 0):
+                return
+
+            # User doesn't want a virtenv recommendation, but he already
+            # installed one via virtenv with a newer version.
+            # So, print commands to enable it
+            if self.latest_avail_ver > self.cur_version:
+                print("\nYou may also use the Sphinx virtualenv version {self.latest_avail_ver} with:")
+                if f"{self.virtenv_prefix}" in os.getcwd():
+                    print("\tdeactivate")
+                print(f"\t. {self.activate_cmd}")
+                self.deactivate_help()
+                return
+            print("\n")
+        else:
+            if self.need_sphinx:
+                self.need += 1
+
+        # Suggest newer versions if current ones are too old
+        if self.latest_avail_ver and self.latest_avail_ver >= self.min_version:
+            if self.latest_avail_ver >= RECOMMENDED_VERSION:
+                print("\nNeed to activate Sphinx (version {self.latest_avail_ver}) on virtualenv with:")
+                print(f"\t. {self.activate_cmd}")
+                self.deactivate_help()
+                return
+
+            # Version is above the minimal required one, but may be
+            # below the recommended one. So, print warnings/notes
+            if self.latest_avail_ver < RECOMMENDED_VERSION:
+                print(f"Warning: It is recommended at least Sphinx version {RECOMMENDED_VERSION}.")
+
+        # At this point, either it needs Sphinx or upgrade is recommended,
+        # both via pip
+
+        if self.rec_sphinx_upgrade:
+            if not self.virtualenv:
+                print("Instead of install/upgrade Python Sphinx pkg, you could use pip/pypi with:\n\n")
+            else:
+                print("To upgrade Sphinx, use:\n\n")
+        else:
+            print("\nSphinx needs to be installed either:\n1) via pip/pypi with:\n")
+
+        self.python_cmd = self.find_python_no_venv()
+
+        print(f"\t{virtualenv_cmd} {self.virtenv_dir}")
+        print(f"\t. {self.virtenv_dir}/bin/activate")
+        print(f"\tpip install -r {self.requirement_file}")
+        self.deactivate_help()
+
+        print("\n2) As a package with:")
+
+        old_need = self.need
+        old_optional = self.optional
+        self.missing = {}
+        self.pdf = False
+        self.optional = 0
+        self.install = ""
+        old_verbose = self.verbose_warn_install
+        self.verbose_warn_install = 0
+
+        self.add_package("python-sphinx", 0)
+
+        self.check_distros()
+
+        self.need = old_need
+        self.optional = old_optional
+        self.verbose_warn_install = old_verbose
+
+        print("\n" \
+              "    Please note that Sphinx >= 3.0 will currently produce false-positive\n" \
+              "   warning when the same name is used for more than one type (functions,\n" \
+              "   structs, enums,...). This is known Sphinx bug. For more details, see:\n" \
+              "\thttps://github.com/sphinx-doc/sphinx/pull/8313")
+
+    def check_needs(self):
+        self.get_system_release()
+
+        # Check if Sphinx is already accessible from current environment
+        self.check_sphinx()
+
+        if self.system_release:
+            print(f"Detected OS: {self.system_release}.")
+        else:
+            print("Unknown OS")
+        if self.cur_version != (0, 0, 0):
+            ver = ver_str(self.cur_version)
+            print(f"Sphinx version: {ver}\n")
+
+        # FIXME: Check python command line, trying first python3
+        self.python_cmd = self.which("python3")
+        if not self.python_cmd:
+            self.python_cmd = self.check_program("python", 0)
+
+        # Check the type of virtual env, depending on Python version
+        if self.python_cmd:
+            if self.virtualenv:
+                try:
+                    result = self.run(
+                        [self.python_cmd, "--version"],
+                        capture_output=True,
+                        text=True,
+                        check=True,
+                    )
+
+                    output = result.stdout + result.stderr
+
+                    match = re.search(r"(\d+)\.(\d+)\.", output)
+                    if match:
+                        major = int(match.group(1))
+                        minor = int(match.group(2))
+
+                        if major < 3:
+                            sys.exit("Python 3 is required to build the kernel docs")
+                        if major == 3 and minor < 3:
+                            self.need_virtualenv = True
+                    else:
+                        sys.exit(f"Warning: couldn't identify {self.python_cmd} version!")
+
+                except subprocess.CalledProcessError as e:
+                    sys.exit(f"Error checking Python version: {e}")
+            else:
+                self.add_package("python-sphinx", 0)
+
+        self.venv_ver = self.recommend_sphinx_upgrade()
+
+        virtualenv_cmd = ""
+
+        if self.need_pip:
+            # Set virtualenv command line, if python < 3.3
+            # FIXME: can be removed as we're now with an upper min requirement
+            #        but then we need to check python version
+            if self.need_virtualenv:
+                virtualenv_cmd = self.which("virtualenv-3")
+                if not virtualenv_cmd:
+                    virtualenv_cmd = self.which("virtualenv-3.5")
+                if not virtualenv_cmd:
+                    self.check_program("virtualenv", 0)
+                    virtualenv_cmd = "virtualenv"
+            else:
+                virtualenv_cmd = f"{self.python_cmd} -m venv"
+                self.check_python_module("ensurepip", 0)
+
+        # Check for needed programs/tools
+        self.check_perl_module("Pod::Usage", 0)
+        self.check_python_module("yaml", 0)
+        self.check_program("make", 0)
+        self.check_program("gcc", 0)
+        self.check_program("dot", 1)
+        self.check_program("convert", 1)
+
+        if self.pdf:
+            # Extra PDF files - should use 2 for LaTeX is_optional
+            self.check_program("xelatex", 2)
+            self.check_program("rsvg-convert", 2)
+            self.check_program("latexmk", 2)
+
+        # Do distro-specific checks and output distro-install commands
+        self.check_distros()
+
+        if not self.python_cmd:
+            if self.need == 1:
+                sys.exit("Can't build as 1 mandatory dependency is missing")
+            elif self.need:
+                sys.exit(f"Can't build as {self.need} mandatory dependencies are missing")
+
+        # Check if sphinx-build is called sphinx-build-3
+        if self.need_symlink:
+            sphinx_path = self.which("sphinx-build-3")
+            if sphinx_path:
+                print(f"\tsudo ln -sf {sphinx_path} /usr/bin/sphinx-build\n")
+
+        self.recommend_sphinx_version(virtualenv_cmd)
+        print("")
+
+        if not self.optional:
+            print("All optional dependencies are met.")
+
+        if self.need == 1:
+            sys.exit("Can't build as 1 mandatory dependency is missing")
+        elif self.need:
+            sys.exit(f"Can't build as {self.need} mandatory dependencies are missing")
+
+        print("Needed package dependencies are met.")
+
+    def get_system_release(self):
+        """
+        Determine the system type. There's no unique way that would work
+        with all distros with a minimal package install. So, several
+        methods are used here.
+
+        By default, it will use lsb_release function. If not available, it will
+        fail back to reading the known different places where the distro name
+        is stored.
+
+        Several modern distros now have /etc/os-release, which usually have
+        a decent coverage.
+        """
+
+        if self.which("lsb_release"):
+            result = self.run(["lsb_release", "-d"], capture_output=True, text=True)
+            self.system_release = result.stdout.replace("Description:", "").strip()
+
+        release_files = [
+            "/etc/system-release",
+            "/etc/redhat-release",
+            "/etc/lsb-release",
+            "/etc/gentoo-release",
+        ]
+
+        if not self.system_release:
+            for f in release_files:
+                self.system_release = self.catcheck(f)
+                if self.system_release:
+                    break
+
+        # This seems more common than LSB these days
+        if not self.system_release:
+            os_var = {}
+            try:
+                with open("/etc/os-release", "r", encoding="utf-8") as f:
+                    for line in f:
+                        match = re.match(r"^([\w\d\_]+)=\"?([^\"]*)\"?\n", line)
+                        if match:
+                            os_var[match.group(1)] = match.group(2)
+
+                self.system_release = os_var.get("NAME", "")
+                if "VERSION_ID" in os_var:
+                    self.system_release += " " + os_var["VERSION_ID"]
+                elif "VERSION" in os_var:
+                    self.system_release += " " + os_var["VERSION"]
+            except IOError:
+                pass
+
+        if not self.system_release:
+            self.system_release = self.catcheck("/etc/issue")
+
+        self.system_release = self.system_release.strip()
+
+DESCRIPTION = """
+Process some flags related to Sphinx installation and documentation build.
+"""
+
+
+def main():
+    parser = argparse.ArgumentParser(description=DESCRIPTION)
+
+    parser.add_argument(
+        "--no-virtualenv",
+        action="store_false",
+        dest="virtualenv",
+        help="Recommend installing Sphinx instead of using a virtualenv",
+    )
+
+    parser.add_argument(
+        "--no-pdf",
+        action="store_false",
+        dest="pdf",
+        help="Don't check for dependencies required to build PDF docs",
+    )
+
+    parser.add_argument(
+        "--version-check",
+        action="store_true",
+        dest="version_check",
+        help="If version is compatible, don't check for missing dependencies",
+    )
+
+    args = parser.parse_args()
+
+    checker = SphinxDependencyChecker(args)
+
+    checker.check_needs()
+
+
+if __name__ == "__main__":
+    main()
diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
deleted file mode 100755
index ad6384166916..000000000000
--- a/scripts/sphinx-pre-install.py
+++ /dev/null
@@ -1,1102 +0,0 @@
-#!/usr/bin/env python3
-# SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2017-2025 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
-#
-# pylint: disable=C0103,C0114,C0115,C0116,C0301
-# pylint: disable=R0902,R0904,R0912,R0915,R1705,R1710,E1121
-
-
-import argparse
-import os
-import re
-import subprocess
-import sys
-from glob import glob
-
-
-def parse_version(version):
-    """Convert a major.minor.patch version into a tuple"""
-#
-    return tuple(int(x) for x in version.split("."))
-
-
-def ver_str(version):
-    """Returns a version tuple as major.minor.patch"""
-
-    return ".".join([str(x) for x in version])
-
-
-RECOMMENDED_VERSION = parse_version("3.4.3")
-
-
-class SphinxDependencyChecker:
-    # List of required texlive packages on Fedora and OpenSuse
-    texlive = {
-        "amsfonts.sty":       "texlive-amsfonts",
-        "amsmath.sty":        "texlive-amsmath",
-        "amssymb.sty":        "texlive-amsfonts",
-        "amsthm.sty":         "texlive-amscls",
-        "anyfontsize.sty":    "texlive-anyfontsize",
-        "atbegshi.sty":       "texlive-oberdiek",
-        "bm.sty":             "texlive-tools",
-        "capt-of.sty":        "texlive-capt-of",
-        "cmap.sty":           "texlive-cmap",
-        "ctexhook.sty":       "texlive-ctex",
-        "ecrm1000.tfm":       "texlive-ec",
-        "eqparbox.sty":       "texlive-eqparbox",
-        "eu1enc.def":         "texlive-euenc",
-        "fancybox.sty":       "texlive-fancybox",
-        "fancyvrb.sty":       "texlive-fancyvrb",
-        "float.sty":          "texlive-float",
-        "fncychap.sty":       "texlive-fncychap",
-        "footnote.sty":       "texlive-mdwtools",
-        "framed.sty":         "texlive-framed",
-        "luatex85.sty":       "texlive-luatex85",
-        "multirow.sty":       "texlive-multirow",
-        "needspace.sty":      "texlive-needspace",
-        "palatino.sty":       "texlive-psnfss",
-        "parskip.sty":        "texlive-parskip",
-        "polyglossia.sty":    "texlive-polyglossia",
-        "tabulary.sty":       "texlive-tabulary",
-        "threeparttable.sty": "texlive-threeparttable",
-        "titlesec.sty":       "texlive-titlesec",
-        "ucs.sty":            "texlive-ucs",
-        "upquote.sty":        "texlive-upquote",
-        "wrapfig.sty":        "texlive-wrapfig",
-    }
-
-    def __init__(self, args):
-        self.pdf = args.pdf
-        self.virtualenv = args.virtualenv
-        self.version_check = args.version_check
-
-        self.missing = {}
-
-        self.need = 0
-        self.optional = 0
-        self.need_symlink = 0
-        self.need_sphinx = 0
-        self.need_pip = 0
-        self.need_virtualenv = 0
-        self.rec_sphinx_upgrade = 0
-        self.verbose_warn_install = 1
-
-        self.system_release = ""
-        self.install = ""
-        self.virtenv_dir = ""
-        self.python_cmd = ""
-        self.activate_cmd = ""
-
-        self.min_version = (0, 0, 0)
-        self.cur_version = (0, 0, 0)
-        self.latest_avail_ver = (0, 0, 0)
-        self.venv_ver = (0, 0, 0)
-
-        prefix = os.environ.get("srctree", ".") + "/"
-
-        self.conf = prefix + "Documentation/conf.py"
-        self.requirement_file = prefix + "Documentation/sphinx/requirements.txt"
-        self.virtenv_prefix = ["sphinx_", "Sphinx_" ]
-
-    #
-    # Ancillary methods that don't depend on self
-    #
-
-    @staticmethod
-    def which(prog):
-        for path in os.environ.get("PATH", "").split(":"):
-            full_path = os.path.join(path, prog)
-            if os.access(full_path, os.X_OK):
-                return full_path
-
-        return None
-
-    @staticmethod
-    def find_python_no_venv():
-        # FIXME: does it makes sense now that this script is in Python?
-
-        result = subprocess.run(["pwd"], capture_output=True, text=True)
-        cur_dir = result.stdout.strip()
-
-        python_names = ["python3", "python"]
-
-        for d in os.environ.get("PATH", "").split(":"):
-            if f"{cur_dir}/sphinx" in d:
-                continue
-
-            for p in python_names:
-                if os.access(os.path.join(d, p), os.X_OK):
-                    return os.path.join(d, p)
-
-        # Python not found at the PATH
-        return python_names[-1]
-
-    @staticmethod
-    def run(*args, **kwargs):
-        """Excecute a command, hiding its output by default"""
-
-        if not kwargs.get('capture_output', False):
-            if 'stdout' not in kwargs:
-                kwargs['stdout'] = subprocess.DEVNULL
-            if 'stderr' not in kwargs:
-                kwargs['stderr'] = subprocess.DEVNULL
-
-        return subprocess.run(*args, **kwargs)
-
-    #
-    # Methods to check if a feature exists
-    #
-
-    # Note: is_optional has 3 states:
-    #   - 0: mandatory
-    #   - 1: optional, but nice to have
-    #   - 2: LaTeX optional - pdf builds without it, but may have visual impact
-
-    def check_missing(self, progs):
-        for prog, is_optional in sorted(self.missing.items()):
-            # At least on some LTS distros like CentOS 7, texlive doesn't
-            # provide all packages we need. When such distros are
-            # detected, we have to disable PDF output.
-            #
-            # So, we need to ignore the packages that distros would
-            # need for LaTeX to work
-            if is_optional == 2 and not self.pdf:
-                self.optional -= 1
-                continue
-
-            if self.verbose_warn_install:
-                if is_optional:
-                    print(f'Warning: better to also install "{prog}".')
-                else:
-                    print(f'ERROR: please install "{prog}", otherwise, build won\'t work.')
-
-            self.install += " " + progs.get(prog, prog)
-
-        self.install = self.install.lstrip()
-
-    def add_package(self, package, is_optional):
-        self.missing[package] = is_optional
-        if is_optional:
-            self.optional += 1
-        else:
-            self.need += 1
-
-    def check_missing_file(self, files, package, is_optional):
-        for f in files:
-            if os.path.exists(f):
-                return
-        self.add_package(package, is_optional)
-
-    def check_program(self, prog, is_optional):
-        found = self.which(prog)
-        if found:
-            return found
-
-        self.add_package(prog, is_optional)
-
-        return None
-
-    def check_perl_module(self, prog, is_optional):
-        # While testing with lxc download template, one of the
-        # distros (Oracle) didn't have perl - nor even an option to install
-        # before installing oraclelinux-release-el9 package.
-        #
-        # Check it before running an error. If perl is not there,
-        # add it as a mandatory package, as some parts of the doc builder
-        # needs it.
-        if not self.which("perl"):
-            self.add_package("perl", 0)
-            self.add_package(prog, is_optional)
-            return
-
-        try:
-            self.run(["perl", f"-M{prog}", "-e", "1"], check=True)
-        except subprocess.CalledProcessError:
-            self.add_package(prog, is_optional)
-
-    def check_python_module(self, module, is_optional):
-        # FIXME: is it needed at the Python version? Maybe due to venv?
-        if not self.python_cmd:
-            return
-
-        try:
-            self.run([self.python_cmd, "-c", f"import {module}"], check=True)
-        except subprocess.CalledProcessError:
-            self.add_package(module, is_optional)
-
-    def check_rpm_missing(self, pkgs, is_optional):
-        for prog in pkgs:
-            try:
-                self.run(["rpm", "-q", prog], check=True)
-            except subprocess.CalledProcessError:
-                self.add_package(prog, is_optional)
-
-    def check_pacman_missing(self, pkgs, is_optional):
-        for prog in pkgs:
-            try:
-                self.run(["pacman", "-Q", prog], check=True)
-            except subprocess.CalledProcessError:
-                self.add_package(prog, is_optional)
-
-    def check_missing_tex(self, is_optional):
-        kpsewhich = self.which("kpsewhich")
-        for prog, package in self.texlive.items():
-
-            # If kpsewhich is not there, just add it to deps
-            if not kpsewhich:
-                self.add_package(package, is_optional)
-                continue
-
-            # Check if the package is needed
-            try:
-                result = self.run(
-                    [kpsewhich, prog], stdout=subprocess.PIPE, text=True, check=True
-                )
-
-                # Didn't find. Add it
-                if not result.stdout.strip():
-                    self.add_package(package, is_optional)
-
-            except subprocess.CalledProcessError:
-                # kpsewhich returned an error. Add it, just in case
-                self.add_package(package, is_optional)
-
-    def get_sphinx_fname(self):
-        if "SPHINXBUILD" in os.environ:
-            return os.environ["SPHINXBUILD"]
-
-        fname = "sphinx-build"
-        if self.which(fname):
-            return fname
-
-        fname = "sphinx-build-3"
-        if self.which(fname):
-            self.need_symlink = 1
-            return fname
-
-        return ""
-
-    def get_sphinx_version(self, cmd):
-        try:
-            result = self.run([cmd, "--version"],
-                              stdout=subprocess.PIPE,
-                              stderr=subprocess.STDOUT,
-                              text=True, check=True)
-        except (subprocess.CalledProcessError, FileNotFoundError):
-            return None
-
-        for line in result.stdout.split("\n"):
-            match = re.match(r"^sphinx-build\s+([\d\.]+)(?:\+(?:/[\da-f]+)|b\d+)?\s*$", line)
-            if match:
-                return parse_version(m1.group(1))
-
-            match = re.match(r"^Sphinx.*\s+([\d\.]+)\s*$", line)
-            if match:
-                return parse_version(m2.group(1))
-
-    def check_sphinx(self):
-        try:
-            with open(self.conf, "r", encoding="utf-8") as f:
-                for line in f:
-                    match = re.match(r"^\s*needs_sphinx\s*=\s*[\'\"]([\d\.]+)[\'\"]", line)
-                    if match:
-                        self.min_version = parse_version(match.group(1))
-                        break
-        except IOError:
-            sys.exit(f"Can't open {self.conf}")
-
-        if not self.min_version:
-            sys.exit(f"Can't get needs_sphinx version from {self.conf}")
-
-        self.virtenv_dir = self.virtenv_prefix[0] + "latest"
-
-        sphinx = self.get_sphinx_fname()
-        if not sphinx:
-            self.need_sphinx = 1
-            return
-
-        self.cur_version = self.get_sphinx_version(sphinx)
-        if not self.cur_version:
-            sys.exit(f"{sphinx} didn't return its version")
-
-        if self.cur_version < self.min_version:
-            curver = ver_str(self.cur_version)
-            minver = ver_str(self.min_version)
-
-            print(f"ERROR: Sphinx version is {curver}. It should be >= {minver}")
-            self.need_sphinx = 1
-            return
-
-        # On version check mode, just assume Sphinx has all mandatory deps
-        if self.version_check and self.cur_version >= RECOMMENDED_VERSION:
-            sys.exit(0)
-
-    def catcheck(self, filename):
-        if os.path.exists(filename):
-            with open(filename, "r", encoding="utf-8") as f:
-                return f.read().strip()
-        return ""
-
-    #
-    # Distro-specific hints methods
-    #
-
-    def give_debian_hints(self):
-        progs = {
-            "Pod::Usage":    "perl-modules",
-            "convert":       "imagemagick",
-            "dot":           "graphviz",
-            "ensurepip":     "python3-venv",
-            "python-sphinx": "python3-sphinx",
-            "rsvg-convert":  "librsvg2-bin",
-            "virtualenv":    "virtualenv",
-            "xelatex":       "texlive-xetex",
-            "yaml":          "python3-yaml",
-        }
-
-        if self.pdf:
-            pdf_pkgs = {
-                "texlive-lang-chinese": [
-                    "/usr/share/texlive/texmf-dist/tex/latex/ctex/ctexhook.sty",
-                ],
-                "fonts-dejavu": [
-                    "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf",
-                ],
-                "fonts-noto-cjk": [
-                    "/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc",
-                    "/usr/share/fonts/opentype/noto/NotoSansCJK-Regular.ttc",
-                    "/usr/share/fonts/opentype/noto/NotoSerifCJK-Regular.ttc",
-                ],
-            }
-
-            for package, files in pdf_pkgs.items():
-                self.check_missing_file(files, package, 2)
-
-            self.check_program("dvipng", 2)
-
-        self.check_missing(progs)
-
-        if not self.need and not self.optional:
-            return
-
-        if self.verbose_warn_install:
-            print("You should run:")
-        print(f"\n\tsudo apt-get install {self.install}")
-
-    def give_redhat_hints(self):
-        progs = {
-            "Pod::Usage":       "perl-Pod-Usage",
-            "convert":          "ImageMagick",
-            "dot":              "graphviz",
-            "python-sphinx":    "python3-sphinx",
-            "rsvg-convert":     "librsvg2-tools",
-            "virtualenv":       "python3-virtualenv",
-            "xelatex":          "texlive-xetex-bin",
-            "yaml":             "python3-pyyaml",
-        }
-
-        fedora26_opt_pkgs = [
-            "graphviz-gd",  # Fedora 26: needed for PDF support
-        ]
-
-        fedora_tex_pkgs = [
-            "dejavu-sans-fonts",
-            "dejavu-sans-mono-fonts",
-            "dejavu-serif-fonts",
-            "texlive-collection-fontsrecommended",
-            "texlive-collection-latex",
-            "texlive-xecjk",
-        ]
-
-        old = 0
-        rel = None
-        pkg_manager = "dnf"
-
-        match = re.search(r"(release|Linux)\s+(\d+)", self.system_release)
-        if match:
-            rel = int(match.group(2))
-
-        if not rel:
-            print("Couldn't identify release number")
-            old = 1
-            self.pdf = False
-        elif re.search("Fedora", self.system_release):
-            # Fedora 38 and upper use this CJK font
-
-            noto_sans_redhat = "google-noto-sans-cjk-fonts"
-        else:
-            # Almalinux, CentOS, RHEL, ...
-
-            # at least up to version 9 (and Fedora < 38), that's the CJK font
-            noto_sans_redhat = "google-noto-sans-cjk-ttc-fonts"
-
-            progs["virtualenv"] = "python-virtualenv"
-
-            if rel and rel < 8:
-                old = 1
-                self.pdf = False
-
-                # RHEL 7 is in ELS, currently up to Jun, 2026
-
-                print("Note: texlive packages on RHEL/CENTOS <= 7 are incomplete. Can't support PDF output")
-                print("If you want to build PDF, please read:")
-                print("\thttps://www.systutorials.com/241660/how-to-install-tex-live-on-centos-7-linux/")
-
-        if self.pdf:
-            pdf_pkgs = [
-                "/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
-                "/usr/share/fonts/google-noto-sans-cjk-fonts/NotoSansCJK-Regular.ttc",
-            ]
-
-            self.check_missing_file(pdf_pkgs, noto_sans_redhat, 2)
-
-            if not old:
-                self.check_rpm_missing(fedora26_opt_pkgs, 2)
-                self.check_rpm_missing(fedora_tex_pkgs, 2)
-
-            self.check_missing_tex(2)
-
-        self.check_missing(progs)
-
-        if not self.need and not self.optional:
-            return
-
-        if self.verbose_warn_install:
-            print("You should run:")
-
-        if old:
-            # dnf is there since Fedora 18+ and RHEL 8
-            pkg_manager = "yum"
-
-        print(f"\n\tsudo {pkg_manager} install -y {self.install}")
-
-    def give_opensuse_hints(self):
-        progs = {
-            "Pod::Usage":    "perl-Pod-Usage",
-            "convert":       "ImageMagick",
-            "dot":           "graphviz",
-            "python-sphinx": "python3-sphinx",
-            "virtualenv":    "python3-virtualenv",
-            "xelatex":       "texlive-xetex-bin",
-            "yaml":          "python3-pyyaml",
-        }
-
-        # On Tumbleweed, this package is also named rsvg-convert
-        if not re.search(r"Tumbleweed", self.system_release):
-            progs["rsvg-convert"] = "rsvg-view"
-
-        suse_tex_pkgs = [
-            "texlive-babel-english",
-            "texlive-caption",
-            "texlive-colortbl",
-            "texlive-courier",
-            "texlive-dvips",
-            "texlive-helvetic",
-            "texlive-makeindex",
-            "texlive-metafont",
-            "texlive-metapost",
-            "texlive-palatino",
-            "texlive-preview",
-            "texlive-times",
-            "texlive-zapfchan",
-            "texlive-zapfding",
-        ]
-
-        progs["latexmk"] = "texlive-latexmk-bin"
-
-        # FIXME: add support for installing CJK fonts
-        #
-        # I tried hard, but was unable to find a way to install
-        # "Noto Sans CJK SC" on openSUSE
-
-        if self.pdf:
-            self.check_rpm_missing(suse_tex_pkgs, 2)
-        if self.pdf:
-            self.check_missing_tex(2)
-        self.check_missing(progs)
-
-        if not self.need and not self.optional:
-            return
-
-        if self.verbose_warn_install:
-            print("You should run:")
-        print(f"\n\tsudo zypper install --no-recommends {self.install}")
-
-    def give_mageia_hints(self):
-        progs = {
-            "Pod::Usage":    "perl-Pod-Usage",
-            "convert":       "ImageMagick",
-            "dot":           "graphviz",
-            "python-sphinx": "python3-sphinx",
-            "rsvg-convert":  "librsvg2",
-            "virtualenv":    "python3-virtualenv",
-            "xelatex":       "texlive",
-            "yaml":          "python3-yaml",
-        }
-
-        tex_pkgs = [
-            "texlive-fontsextra",
-        ]
-
-        if re.search(r"OpenMandriva", self.system_release):
-            packager_cmd = "dnf install"
-            noto_sans = "noto-sans-cjk-fonts"
-            tex_pkgs = ["texlive-collection-fontsextra"]
-        else:
-            packager_cmd = "urpmi"
-            noto_sans = "google-noto-sans-cjk-ttc-fonts"
-
-        progs["latexmk"] = "texlive-collection-basic"
-
-        if self.pdf:
-            pdf_pkgs = [
-                "/usr/share/fonts/google-noto-cjk/NotoSansCJK-Regular.ttc",
-                "/usr/share/fonts/TTF/NotoSans-Regular.ttf",
-            ]
-
-            self.check_missing_file(pdf_pkgs, noto_sans, 2)
-            self.check_rpm_missing(tex_pkgs, 2)
-
-        self.check_missing(progs)
-
-        if not self.need and not self.optional:
-            return
-        if self.verbose_warn_install:
-            print("You should run:")
-        print(f"\n\tsudo {packager_cmd} {self.install}")
-
-    def give_arch_linux_hints(self):
-        progs = {
-            "convert":      "imagemagick",
-            "dot":          "graphviz",
-            "latexmk":      "texlive-core",
-            "rsvg-convert": "extra/librsvg",
-            "virtualenv":   "python-virtualenv",
-            "xelatex":      "texlive-xetex",
-            "yaml":         "python-yaml",
-        }
-
-        archlinux_tex_pkgs = [
-            "texlive-core",
-            "texlive-latexextra",
-            "ttf-dejavu",
-        ]
-
-        if self.pdf:
-            self.check_pacman_missing(archlinux_tex_pkgs, 2)
-
-            self.check_missing_file(
-                ["/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc"],
-                "noto-fonts-cjk",
-                2,
-            )
-
-        self.check_missing(progs)
-
-        if not self.need and not self.optional:
-            return
-        if self.verbose_warn_install:
-            print("You should run:")
-        print(f"\n\tsudo pacman -S {self.install}")
-
-    def give_gentoo_hints(self):
-        progs = {
-            "convert":      "media-gfx/imagemagick",
-            "dot":          "media-gfx/graphviz",
-            "rsvg-convert": "gnome-base/librsvg",
-            "virtualenv":   "dev-python/virtualenv",
-            "xelatex":      "dev-texlive/texlive-xetex media-fonts/dejavu",
-            "yaml":         "dev-python/pyyaml",
-        }
-
-        if self.pdf:
-            pdf_pkgs = {
-                "media-fonts/dejavu": [
-                    "/usr/share/fonts/dejavu/DejaVuSans.ttf",
-                ],
-                "media-fonts/noto-cjk": [
-                    "/usr/share/fonts/noto-cjk/NotoSansCJKsc-Regular.otf",
-                    "/usr/share/fonts/noto-cjk/NotoSerifCJK-Regular.ttc",
-                ],
-            }
-            for package, files in pdf_pkgs.items():
-                self.check_missing_file(files, package, 2)
-
-        self.check_missing(progs)
-
-        if not self.need and not self.optional:
-            return
-
-        if self.verbose_warn_install:
-            print("You should run:")
-        print("\n")
-
-        imagemagick = "media-gfx/imagemagick svg png"
-        cairo = "media-gfx/graphviz cairo pdf"
-        portage_imagemagick = "/etc/portage/package.use/imagemagick"
-        portage_cairo = "/etc/portage/package.use/graphviz"
-
-        result = self.run(["grep", "imagemagick", portage_imagemagick],
-                          stdout=subprocess.PIPE, text=True)
-        if not result.stdout.strip():
-            print(f"\tsudo su -c 'echo \"{imagemagick}\" > {portage_imagemagick}'")
-
-        result = self.run(["grep", "graphviz", portage_cairo],
-                          stdout=subprocess.PIPE, text=True)
-
-        if not result.stdout.strip():
-            print(f"\tsudo su -c 'echo \"{cairo}\" > {portage_cairo}'")
-
-        print(f"\tsudo emerge --ask {self.install}")
-
-    #
-    # Dispatch the check to an os_specific hinter
-    #
-
-    def check_distros(self):
-        # OS-specific hints logic
-        os_hints = {
-            re.compile("Red Hat Enterprise Linux"):   self.give_redhat_hints,
-            re.compile("Fedora"):                     self.give_redhat_hints,
-            re.compile("AlmaLinux"):                  self.give_redhat_hints,
-            re.compile("Amazon Linux"):               self.give_redhat_hints,
-            re.compile("CentOS"):                     self.give_redhat_hints,
-            re.compile("openEuler"):                  self.give_redhat_hints,
-            re.compile("Oracle Linux Server"):        self.give_redhat_hints,
-            re.compile("Rocky Linux"):                self.give_redhat_hints,
-            re.compile("Scientific Linux"):           self.give_redhat_hints,
-            re.compile("Springdale Open Enterprise"): self.give_redhat_hints,
-
-            re.compile("Ubuntu"):                     self.give_debian_hints,
-            re.compile("Debian"):                     self.give_debian_hints,
-            re.compile("Devuan"):                     self.give_debian_hints,
-            re.compile("Kali"):                       self.give_debian_hints,
-            re.compile("Mint"):                       self.give_debian_hints,
-
-            re.compile("openSUSE"):                   self.give_opensuse_hints,
-
-            re.compile("Mageia"):                     self.give_mageia_hints,
-            re.compile("OpenMandriva"):               self.give_mageia_hints,
-
-            re.compile("Arch Linux"):                 self.give_arch_linux_hints,
-            re.compile("Gentoo"):                     self.give_gentoo_hints,
-        }
-
-        # If the OS is detected, use per-OS hint logic
-        for regex, os_hint in os_hints.items():
-            if regex.search(self.system_release):
-                os_hint()
-
-                return
-
-        #
-        # Fall-back to generic hint code for other distros
-        # That's far from ideal, specially for LaTeX dependencies.
-        #
-        progs = {"sphinx-build": "sphinx"}
-        if self.pdf:
-            self.check_missing_tex(2)
-
-        self.check_missing(progs)
-
-        print(f"I don't know distro {self.system_release}.")
-        print("So, I can't provide you a hint with the install procedure.")
-        print("There are likely missing dependencies.")
-
-    #
-    # Common dependencies
-    #
-    def deactivate_help(self):
-        print("\n    If you want to exit the virtualenv, you can use:")
-        print("\tdeactivate")
-
-    def get_virtenv(self):
-        cwd = os.getcwd()
-
-        activates = []
-
-        # Add all sphinx prefixes with possible version numbers
-        for p in self.virtenv_prefix:
-            activates += glob(f"{cwd}/{p}[0-9]*/bin/activate")
-
-        activates.sort(reverse=True, key=str.lower)
-
-        # Place sphinx_latest first, if it exists
-        for p in self.virtenv_prefix:
-            activates = glob(f"{cwd}/{p}*latest/bin/activate") + activates
-
-        ver = (0, 0, 0)
-        for f in activates:
-            # Discard too old Sphinx virtual environments
-            match = re.search(r"(\d+)\.(\d+)\.(\d+)", f)
-            if match:
-                ver = (int(match.group(1)), int(match.group(2)), int(match.group(3)))
-
-                if ver < self.min_version:
-                    continue
-
-            sphinx_cmd = f.replace("activate", "sphinx-build")
-            if not os.path.isfile(sphinx_cmd):
-                continue
-
-            ver = self.get_sphinx_version(sphinx_cmd)
-
-            if not ver:
-                venv_dir = f.replace("/bin/activate", "")
-                print(f"Warning: virtual environment {venv_dir} is not working.\n" \
-                      "Python version upgrade? Remove it with:\n\n" \
-                      "\trm -rf {venv_dir}\n\n")
-            else:
-                if self.need_sphinx and ver >= self.min_version:
-                    return (f, ver)
-                elif parse_version(ver) > self.cur_version:
-                    return (f, ver)
-
-        return ("", ver)
-
-    def recommend_sphinx_upgrade(self):
-        # Avoid running sphinx-builds from venv if cur_version is good
-        if self.cur_version and self.cur_version >= RECOMMENDED_VERSION:
-            self.latest_avail_ver = self.cur_version
-            return None
-
-        # Get the highest version from sphinx_*/bin/sphinx-build and the
-        # corresponding command to activate the venv/virtenv
-        self.activate_cmd, self.venv_ver = self.get_virtenv()
-
-        # Store the highest version from Sphinx existing virtualenvs
-        if self.activate_cmd and self.venv_ver > self.cur_version:
-            self.latest_avail_ver = self.venv_ver
-        else:
-            if self.cur_version:
-                self.latest_avail_ver = self.cur_version
-            else:
-                self.latest_avail_ver = (0, 0, 0)
-
-        # As we don't know package version of Sphinx, and there's no
-        # virtual environments, don't check if upgrades are needed
-        if not self.virtualenv:
-            if not self.latest_avail_ver:
-                return None
-
-            return self.latest_avail_ver
-
-        # Either there are already a virtual env or a new one should be created
-        self.need_pip = 1
-
-        if not self.latest_avail_ver:
-            return None
-
-        # Return if the reason is due to an upgrade or not
-        if self.latest_avail_ver != (0, 0, 0):
-            if self.latest_avail_ver < RECOMMENDED_VERSION:
-                self.rec_sphinx_upgrade = 1
-
-        return self.latest_avail_ver
-
-    def recommend_sphinx_version(self, virtualenv_cmd):
-        # The logic here is complex, as it have to deal with different versions:
-        #	- minimal supported version;
-        #	- minimal PDF version;
-        #	- recommended version.
-        # It also needs to work fine with both distro's package and venv/virtualenv
-
-        # Version is OK. Nothing to do.
-        if self.cur_version != (0, 0, 0) and self.cur_version >= RECOMMENDED_VERSION:
-            return
-
-        if not self.need_sphinx:
-            # sphinx-build is present and its version is >= $min_version
-
-            # only recommend enabling a newer virtenv version if makes sense.
-            if self.latest_avail_ver and self.latest_avail_ver > self.cur_version:
-                print("\nYou may also use the newer Sphinx version {self.latest_avail_ver} with:")
-                if f"{self.virtenv_prefix}" in os.getcwd():
-                    print("\tdeactivate")
-                print(f"\t. {self.activate_cmd}")
-                self.deactivate_help()
-                return
-
-            if self.latest_avail_ver and self.latest_avail_ver >= RECOMMENDED_VERSION:
-                return
-
-        if not self.virtualenv:
-            # No sphinx either via package or via virtenv. As we can't
-            # Compare the versions here, just return, recommending the
-            # user to install it from the package distro.
-            if not self.latest_avail_ver or self.latest_avail_ver == (0, 0, 0):
-                return
-
-            # User doesn't want a virtenv recommendation, but he already
-            # installed one via virtenv with a newer version.
-            # So, print commands to enable it
-            if self.latest_avail_ver > self.cur_version:
-                print("\nYou may also use the Sphinx virtualenv version {self.latest_avail_ver} with:")
-                if f"{self.virtenv_prefix}" in os.getcwd():
-                    print("\tdeactivate")
-                print(f"\t. {self.activate_cmd}")
-                self.deactivate_help()
-                return
-            print("\n")
-        else:
-            if self.need_sphinx:
-                self.need += 1
-
-        # Suggest newer versions if current ones are too old
-        if self.latest_avail_ver and self.latest_avail_ver >= self.min_version:
-            if self.latest_avail_ver >= RECOMMENDED_VERSION:
-                print("\nNeed to activate Sphinx (version {self.latest_avail_ver}) on virtualenv with:")
-                print(f"\t. {self.activate_cmd}")
-                self.deactivate_help()
-                return
-
-            # Version is above the minimal required one, but may be
-            # below the recommended one. So, print warnings/notes
-            if self.latest_avail_ver < RECOMMENDED_VERSION:
-                print(f"Warning: It is recommended at least Sphinx version {RECOMMENDED_VERSION}.")
-
-        # At this point, either it needs Sphinx or upgrade is recommended,
-        # both via pip
-
-        if self.rec_sphinx_upgrade:
-            if not self.virtualenv:
-                print("Instead of install/upgrade Python Sphinx pkg, you could use pip/pypi with:\n\n")
-            else:
-                print("To upgrade Sphinx, use:\n\n")
-        else:
-            print("\nSphinx needs to be installed either:\n1) via pip/pypi with:\n")
-
-        self.python_cmd = self.find_python_no_venv()
-
-        print(f"\t{virtualenv_cmd} {self.virtenv_dir}")
-        print(f"\t. {self.virtenv_dir}/bin/activate")
-        print(f"\tpip install -r {self.requirement_file}")
-        self.deactivate_help()
-
-        print("\n2) As a package with:")
-
-        old_need = self.need
-        old_optional = self.optional
-        self.missing = {}
-        self.pdf = False
-        self.optional = 0
-        self.install = ""
-        old_verbose = self.verbose_warn_install
-        self.verbose_warn_install = 0
-
-        self.add_package("python-sphinx", 0)
-
-        self.check_distros()
-
-        self.need = old_need
-        self.optional = old_optional
-        self.verbose_warn_install = old_verbose
-
-        print("\n" \
-              "    Please note that Sphinx >= 3.0 will currently produce false-positive\n" \
-              "   warning when the same name is used for more than one type (functions,\n" \
-              "   structs, enums,...). This is known Sphinx bug. For more details, see:\n" \
-              "\thttps://github.com/sphinx-doc/sphinx/pull/8313")
-
-    def check_needs(self):
-        self.get_system_release()
-
-        # Check if Sphinx is already accessible from current environment
-        self.check_sphinx()
-
-        if self.system_release:
-            print(f"Detected OS: {self.system_release}.")
-        else:
-            print("Unknown OS")
-        if self.cur_version != (0, 0, 0):
-            ver = ver_str(self.cur_version)
-            print(f"Sphinx version: {ver}\n")
-
-        # FIXME: Check python command line, trying first python3
-        self.python_cmd = self.which("python3")
-        if not self.python_cmd:
-            self.python_cmd = self.check_program("python", 0)
-
-        # Check the type of virtual env, depending on Python version
-        if self.python_cmd:
-            if self.virtualenv:
-                try:
-                    result = self.run(
-                        [self.python_cmd, "--version"],
-                        capture_output=True,
-                        text=True,
-                        check=True,
-                    )
-
-                    output = result.stdout + result.stderr
-
-                    match = re.search(r"(\d+)\.(\d+)\.", output)
-                    if match:
-                        major = int(match.group(1))
-                        minor = int(match.group(2))
-
-                        if major < 3:
-                            sys.exit("Python 3 is required to build the kernel docs")
-                        if major == 3 and minor < 3:
-                            self.need_virtualenv = True
-                    else:
-                        sys.exit(f"Warning: couldn't identify {self.python_cmd} version!")
-
-                except subprocess.CalledProcessError as e:
-                    sys.exit(f"Error checking Python version: {e}")
-            else:
-                self.add_package("python-sphinx", 0)
-
-        self.venv_ver = self.recommend_sphinx_upgrade()
-
-        virtualenv_cmd = ""
-
-        if self.need_pip:
-            # Set virtualenv command line, if python < 3.3
-            # FIXME: can be removed as we're now with an upper min requirement
-            #        but then we need to check python version
-            if self.need_virtualenv:
-                virtualenv_cmd = self.which("virtualenv-3")
-                if not virtualenv_cmd:
-                    virtualenv_cmd = self.which("virtualenv-3.5")
-                if not virtualenv_cmd:
-                    self.check_program("virtualenv", 0)
-                    virtualenv_cmd = "virtualenv"
-            else:
-                virtualenv_cmd = f"{self.python_cmd} -m venv"
-                self.check_python_module("ensurepip", 0)
-
-        # Check for needed programs/tools
-        self.check_perl_module("Pod::Usage", 0)
-        self.check_python_module("yaml", 0)
-        self.check_program("make", 0)
-        self.check_program("gcc", 0)
-        self.check_program("dot", 1)
-        self.check_program("convert", 1)
-
-        if self.pdf:
-            # Extra PDF files - should use 2 for LaTeX is_optional
-            self.check_program("xelatex", 2)
-            self.check_program("rsvg-convert", 2)
-            self.check_program("latexmk", 2)
-
-        # Do distro-specific checks and output distro-install commands
-        self.check_distros()
-
-        if not self.python_cmd:
-            if self.need == 1:
-                sys.exit("Can't build as 1 mandatory dependency is missing")
-            elif self.need:
-                sys.exit(f"Can't build as {self.need} mandatory dependencies are missing")
-
-        # Check if sphinx-build is called sphinx-build-3
-        if self.need_symlink:
-            sphinx_path = self.which("sphinx-build-3")
-            if sphinx_path:
-                print(f"\tsudo ln -sf {sphinx_path} /usr/bin/sphinx-build\n")
-
-        self.recommend_sphinx_version(virtualenv_cmd)
-        print("")
-
-        if not self.optional:
-            print("All optional dependencies are met.")
-
-        if self.need == 1:
-            sys.exit("Can't build as 1 mandatory dependency is missing")
-        elif self.need:
-            sys.exit(f"Can't build as {self.need} mandatory dependencies are missing")
-
-        print("Needed package dependencies are met.")
-
-    def get_system_release(self):
-        """
-        Determine the system type. There's no unique way that would work
-        with all distros with a minimal package install. So, several
-        methods are used here.
-
-        By default, it will use lsb_release function. If not available, it will
-        fail back to reading the known different places where the distro name
-        is stored.
-
-        Several modern distros now have /etc/os-release, which usually have
-        a decent coverage.
-        """
-
-        if self.which("lsb_release"):
-            result = self.run(["lsb_release", "-d"], capture_output=True, text=True)
-            self.system_release = result.stdout.replace("Description:", "").strip()
-
-        release_files = [
-            "/etc/system-release",
-            "/etc/redhat-release",
-            "/etc/lsb-release",
-            "/etc/gentoo-release",
-        ]
-
-        if not self.system_release:
-            for f in release_files:
-                self.system_release = self.catcheck(f)
-                if self.system_release:
-                    break
-
-        # This seems more common than LSB these days
-        if not self.system_release:
-            os_var = {}
-            try:
-                with open("/etc/os-release", "r", encoding="utf-8") as f:
-                    for line in f:
-                        match = re.match(r"^([\w\d\_]+)=\"?([^\"]*)\"?\n", line)
-                        if match:
-                            os_var[match.group(1)] = match.group(2)
-
-                self.system_release = os_var.get("NAME", "")
-                if "VERSION_ID" in os_var:
-                    self.system_release += " " + os_var["VERSION_ID"]
-                elif "VERSION" in os_var:
-                    self.system_release += " " + os_var["VERSION"]
-            except IOError:
-                pass
-
-        if not self.system_release:
-            self.system_release = self.catcheck("/etc/issue")
-
-        self.system_release = self.system_release.strip()
-
-DESCRIPTION = """
-Process some flags related to Sphinx installation and documentation build.
-"""
-
-
-def main():
-    parser = argparse.ArgumentParser(description=DESCRIPTION)
-
-    parser.add_argument(
-        "--no-virtualenv",
-        action="store_false",
-        dest="virtualenv",
-        help="Recommend installing Sphinx instead of using a virtualenv",
-    )
-
-    parser.add_argument(
-        "--no-pdf",
-        action="store_false",
-        dest="pdf",
-        help="Don't check for dependencies required to build PDF docs",
-    )
-
-    parser.add_argument(
-        "--version-check",
-        action="store_true",
-        dest="version_check",
-        help="If version is compatible, don't check for missing dependencies",
-    )
-
-    args = parser.parse_args()
-
-    checker = SphinxDependencyChecker(args)
-
-    checker.check_needs()
-
-
-if __name__ == "__main__":
-    main()
-- 
2.49.0

