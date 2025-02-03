Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E820127C;
	Mon,  3 Feb 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581236; cv=none; b=tNknxnJOYV2VeZUo7cOYpRMLJDLkxPykm8W5qBjm2INVo90xmEnlxlAo5XG0VUr9HnF6pZmMzRnTs9gS7hrGXJswO8EZWW7G7NK3o+ugQJGgp1m46+6Eml3Ud/sjHh1W6imsJMRARsG3VlkkKXLU2jSX773KGnbEbYtVXgHLzkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581236; c=relaxed/simple;
	bh=PSOhdo2wG1nNZgNFaChydOIJHrYmrBB3DhxiVc/T3Zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNeIdUMtzQ30p4gkdMi6dC5OQZd6cQc0+Yhp9CvmKp187wGsPHXj6hUv3jKOuro7wrVs4UaWRkzU8o+jsXi68WyYfjqhHH6YqvBGKYsAM8ytGZoNDB4YQt5MAY61tCnSxgA9GhoVbyAefKhgwVTOo/O0NsN+Vt0cyRvGA853FaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=YDcW0LCE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=YzP4I6Wf; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=u3y1G6b2; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ywTI7Dt8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="YDcW0LCE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="YzP4I6Wf";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="u3y1G6b2";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ywTI7Dt8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5B021F38F;
	Mon,  3 Feb 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738581229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Su8HeT8QqYu4PRQk3bpU6SicYtgiqJsFw1ydru1a46k=;
	b=YDcW0LCEfgFqk3HjSlJT7EdYDjudubJheXGAtKAAz+ZpC2CtYho0TtALQEZRNDhRGWOpPy
	1nc/DPUewYtw5eVwLOBbw1Uyi8datCpAidJigshk66M3EikMYb+bLPj+dSrIPgWvZIW7oS
	4liDRr4/WdqcGxnrwbykGMd6rBdIDXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738581229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Su8HeT8QqYu4PRQk3bpU6SicYtgiqJsFw1ydru1a46k=;
	b=YzP4I6WfMmHGXwtfosAvK76epjecULIMXiiMsbizaPqOw/51hUUSnD4/7O+J+yTeUSkj1/
	Ww3rfQ5F8av+/rAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=u3y1G6b2;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=ywTI7Dt8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738581224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Su8HeT8QqYu4PRQk3bpU6SicYtgiqJsFw1ydru1a46k=;
	b=u3y1G6b2ik+SA4SsfuQPGNohd6GzsXCperyb0o15fNsYL+ZFYYQIxhIPRNISytj2s7KiZ0
	aK389amSfDoMtIClQ9I+C2xRcLLfOwBkj0Lh+kLK7mdl/2lvLthyGBQXbx2hnLXyZoSvk6
	8rGGDTEhOPIfQrXqDXxuXrMQ5YyWIL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738581224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Su8HeT8QqYu4PRQk3bpU6SicYtgiqJsFw1ydru1a46k=;
	b=ywTI7Dt8EWBaZg2hWVMJbcDNg5ieRNT1m5jkV33eQzrz04VMFZnr+Od/XM7hiUoxa9NbTM
	OOErF/WzBjQ0g6DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C332F13A7F;
	Mon,  3 Feb 2025 11:13:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +KddL+ikoGdNAwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 03 Feb 2025 11:13:44 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Mon, 03 Feb 2025 12:13:16 +0100
Subject: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
In-Reply-To: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
To: Joe Perches <joe@perches.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5312; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=PSOhdo2wG1nNZgNFaChydOIJHrYmrBB3DhxiVc/T3Zs=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBnoKTiPHIIgmm2CeirBP9/ruJY6uKMsDl8jVCB2
 +s1LbjanWeJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCZ6Ck4gAKCRC74LB10kWI
 midiB/sGfOcldvIic33b/5+kdfxZzCjynq6OQhMqqti4h8hDA831WsMGTN9a0SeDWczVumJSeiX
 +Hx5tkgvwiaktXlfW0JqtenvEkiuzDjaqqePxV1iuDQmy1p5XVZcCrHsoeYS9p2ty6mxkmypk08
 ntPF+uEZgyRMFh5ORklc/gQD/cG76zk7uql6V7EHDuE/HRX9vdhqQZeLfq52PUNyiSWsCUzm8n8
 COlxVjDKWpBZVjMGhEAJQ5N4x523Kn8EURXVI3ECLtekKdp3pHv0SIhrWFKHGVu253eeR1NvM+A
 dWqwlxP2wS9f7zAgHMQbr6wtEpMRFoPO3pGcWVsZYECISJTn
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Rspamd-Queue-Id: D5B021F38F
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,suse.cz:mid,suse.cz:email];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The subsystem status is currently reported with --role(stats) by
adjusting the maintainer role for any status different from Maintained.
This has two downsides:

- if a subsystem has only reviewers or mailing lists and no maintainers,
  the status is not reported (i.e. typically, Orphan subsystems have no
  maintainers)

- the Supported status means that someone is paid for maintaining, but
  it is reported as "supporter" for all the maintainers, which can be
  incorrect. People have been also confused about what "supporter"
  means.

This patch introduces a new --substatus option and functionality aimed
to report the subsystem status separately, without adjusting the
reported maintainer role. After the e-mails are output, the status of
subsystems will follow, for example:

...
linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
LIBRARY CODE status: Supported

In order to allow replacing the role rewriting seamlessly, the new
option works as follows:

- it is automatically enabled when --email and --role are enabled
  (the defaults include --email and --rolestats which implies --role)

- usages with --norolestats e.g. for git's --cc-cmd will thus need no
  adjustments

- the most common Maintained status is not reported at all, to reduce
  unnecessary noise

- THE REST catch-all section (contains lkml) status is not reported

- the existing --subsystem and --status options are unaffected so their
  users will need no adjustments

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 scripts/get_maintainer.pl | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 5ac02e19873722d0f5bf3ac8de8374338c7bddc3..da7fc70f17cd8d46b45da8db0b2029bb11b25af1 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -50,6 +50,7 @@ my $output_multiline = 1;
 my $output_separator = ", ";
 my $output_roles = 0;
 my $output_rolestats = 1;
+my $output_substatus = undef;
 my $output_section_maxlen = 50;
 my $scm = 0;
 my $tree = 1;
@@ -269,6 +270,7 @@ if (!GetOptions(
 		'separator=s' => \$output_separator,
 		'subsystem!' => \$subsystem,
 		'status!' => \$status,
+		'substatus!' => \$output_substatus,
 		'scm!' => \$scm,
 		'tree!' => \$tree,
 		'web!' => \$web,
@@ -314,6 +316,10 @@ $output_multiline = 0 if ($output_separator ne ", ");
 $output_rolestats = 1 if ($interactive);
 $output_roles = 1 if ($output_rolestats);
 
+if (!defined $output_substatus) {
+    $output_substatus = $email && $output_roles;
+}
+
 if ($sections || $letters ne "") {
     $sections = 1;
     $email = 0;
@@ -637,6 +643,7 @@ my @web = ();
 my @bug = ();
 my @subsystem = ();
 my @status = ();
+my @substatus = ();
 my %deduplicate_name_hash = ();
 my %deduplicate_address_hash = ();
 
@@ -651,6 +658,11 @@ if ($scm) {
     output(@scm);
 }
 
+if ($output_substatus) {
+    @substatus = uniq(@substatus);
+    output(@substatus);
+}
+
 if ($status) {
     @status = uniq(@status);
     output(@status);
@@ -859,6 +871,7 @@ sub get_maintainers {
     @bug = ();
     @subsystem = ();
     @status = ();
+    @substatus = ();
     %deduplicate_name_hash = ();
     %deduplicate_address_hash = ();
     if ($email_git_all_signature_types) {
@@ -1073,6 +1086,7 @@ version: $V
     --remove-duplicates => minimize duplicate email names/addresses
     --roles => show roles (status:subsystem, git-signer, list, etc...)
     --rolestats => show roles and statistics (commits/total_commits, %)
+    --substatus => show subsystem status if not Maintained (default: match --roles)"
     --file-emails => add email addresses found in -f file (default: 0 (off))
     --fixes => for patches, add signatures of commits with 'Fixes: <commit>' (default: 1 (on))
   --scm => print SCM tree(s) if any
@@ -1335,7 +1349,9 @@ sub add_categories {
     my $start = find_starting_index($index);
     my $end = find_ending_index($index);
 
-    push(@subsystem, $typevalue[$start]);
+    my $subsystem = $typevalue[$start];
+    push(@subsystem, $subsystem);
+    my $status = "Unknown";
 
     for ($i = $start + 1; $i < $end; $i++) {
 	my $tv = $typevalue[$i];
@@ -1386,8 +1402,8 @@ sub add_categories {
 		}
 	    } elsif ($ptype eq "R") {
 		if ($email_reviewer) {
-		    my $subsystem = get_subsystem_name($i);
-		    push_email_addresses($pvalue, "reviewer:$subsystem" . $suffix);
+		    my $subs = get_subsystem_name($i);
+		    push_email_addresses($pvalue, "reviewer:$subs" . $suffix);
 		}
 	    } elsif ($ptype eq "T") {
 		push(@scm, $pvalue . $suffix);
@@ -1397,9 +1413,14 @@ sub add_categories {
 		push(@bug, $pvalue . $suffix);
 	    } elsif ($ptype eq "S") {
 		push(@status, $pvalue . $suffix);
+		$status = $pvalue;
 	    }
 	}
     }
+
+    if ($subsystem ne "THE REST" and $status ne "Maintained") {
+	push(@substatus, $subsystem . " status: " . $status . $suffix)
+    }
 }
 
 sub email_inuse {
@@ -1903,6 +1924,7 @@ EOT
 		$done = 1;
 		$output_rolestats = 0;
 		$output_roles = 0;
+		$output_substatus = 0;
 		last;
 	    } elsif ($nr =~ /^\d+$/ && $nr > 0 && $nr <= $count) {
 		$selected{$nr - 1} = !$selected{$nr - 1};

-- 
2.48.1

