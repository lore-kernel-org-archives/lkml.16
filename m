Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75E0433AC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060913; cv=none; b=O8+AA9B/iafm+vKcgoY/s08MtOujR6zikYbgCXZ8Eo5lqPqNarMuhraPniQJP39MVsQM1oSfpKWimWzyHrkmDZcyi82PlnfCTRxrQigz5TWvqUTeHNJAY3tJ7bzupPbnraL9nHMUQ8AF+Bx0DLNTrXOP65exNaZ4cco6sr9ImOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060913; c=relaxed/simple;
	bh=ygHY+lEH40QesnnrDxEnQRxK5ku7NCJYl0V8zW8I7SM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=oz3ryA3jSnczHLbcAqQBYzT08gCy6tLqM/VKJbahfp7lFLL8mPL8GFdDx0+sc7Oqk9fIafWMyjAvn8prgh1UuJDRygR4p0KVwggJHwvtinyUp7M3CetZSxs7Iy/eQo1LtYVzP1UKk5BY3lQ/EWUKeLpVInehfn9ycksC2SLKeOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NCXjkeWV; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NCXjkeWV"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G2VXLo004218;
	Mon, 16 Jun 2025 10:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=q1S7SM/wmLUTd5ZvoTKJ3O
	I3RJURAciHmUfP6iV0nsI=; b=NCXjkeWVF0vCTgtRkwMSwHMBqVqN0p9ygK7iEr
	TDQ/tSxzwG607MYlBetPRH9dFeCwNiPvKggJcJ7MSGzK5P7qT6koDkBhhoLdjqXf
	DimiHIuevBoWhySqG9Sj8VfZBr6zoPBynmZuiNilA/aL56QS4RGOn+TEPWtAm4tY
	z70WuUtkFvz88SksMWkGTU49vL0/n79OVjGgCx5xz6PNJ9Q5rhGiYZEUDu9KUobN
	Yf09ixjda44S+x9Bh5kY6SkctXnTXyPcl91RZwzArvQqNt/gfKS0eIu8XFXUg6qk
	MODlMFjyajGwddFqw8wrZxVQjcl+kJY38KD+ITAFHuaOkozA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 478x79q8e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 10:01:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6A6A240044;
	Mon, 16 Jun 2025 09:59:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E13F5D5B3A;
	Mon, 16 Jun 2025 09:59:19 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 09:59:16 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 09:59:13 +0200
Subject: [PATCH RESEND v2] checkpatch: use utf-8 match for spell checking
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-b4-checkpatch-upstream-v2-1-5600ce4a3b43@foss.st.com>
X-B4-Tracking: v=1; b=H4sIANDOT2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Mz3SQT3eSM1OTsgsSS5Azd0oLikqLUxFzdRIvUNBPT5FSDtGRzJaD
 mgqLUtMwKsMHRSkGuwa5+LkqxtbUAkSFpxXAAAAA=
X-Change-ID: 20250616-b4-checkpatch-upstream-a8ef45ce0fc7
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn
	<lukas.bulwahn@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <akpm@linux-foundation.org>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01

From: Antonio Borneo <antonio.borneo@foss.st.com>

The current code that checks for misspelling verifies, in a more
complex regex, if $rawline matches [^\w]($misspellings)[^\w]

Being $rawline a byte-string, a utf-8 character in $rawline can
match the non-word-char [^\w].
E.g.:
	./scripts/checkpatch.pl --git 81c2f059ab9
	WARNING: 'ment' may be misspelled - perhaps 'meant'?
	#36: FILE: MAINTAINERS:14360:
	+M:     Clément Léger <clement.leger@bootlin.com>
	            ^^^^

Use a utf-8 version of $rawline for spell checking.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Reported-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
- Link to v1: https://lore.kernel.org/lkml/20231212094310.3633-1-antonio.borneo@foss.st.com/
---
 scripts/checkpatch.pl | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c..489b74d52abe 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3502,9 +3502,10 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
+			my $rawline_utf8 = decode("utf8", $rawline);
+			while ($rawline_utf8 =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
 				my $typo = $1;
-				my $blank = copy_spacing($rawline);
+				my $blank = copy_spacing($rawline_utf8);
 				my $ptr = substr($blank, 0, $-[1]) . "^" x length($typo);
 				my $hereptr = "$hereline$ptr\n";
 				my $typo_fix = $spelling_fix{lc($typo)};

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250616-b4-checkpatch-upstream-a8ef45ce0fc7

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>

