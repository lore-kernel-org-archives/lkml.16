Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35623202C2A;
	Mon,  3 Feb 2025 11:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581236; cv=none; b=n2Wjc8ICjUIy+2I5aQYPpv6wnJhhEoUhXjATsLS+vj+bs7bsXxRqAA3SaEvpz9bLZqwJ/IZkVNQ5Ma60OB4GaW3JNLJjKKNeHHm8c48L3rjjOP66V5XFQbAle39YiRcKdyP1dBmqw5YyVzM7ZNzgUk2xRw0TyFlQEmQYajamOnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581236; c=relaxed/simple;
	bh=e7rQ6ja5aEko/PdvDV9MQiOOrhtNYuMK/XWIlX2/Y64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TI9b7/JEpdWgL9jJkLmF6FfbFT8h04mj4E8mkll5Pu8FtYCQqTRw9Wf/19LQWYWVlX1IR1HMbEtPidIbARsdJtO3xfQA5pfidt0mShj5x1VydjoWLH236ZBjS+UIon7E7rLOASAD2Sq6cMndCfjC7vcakBH1UY1PJ7IGq4SAmdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=mUAHpSDe; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=gfgQoOeJ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=v+X5MjbE; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ziMobxZ1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="mUAHpSDe";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="gfgQoOeJ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="v+X5MjbE";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ziMobxZ1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E7F7621164;
	Mon,  3 Feb 2025 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738581229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb5zq7frvFT+WumnDDdfbhccoEdy6xM1MzWPfZkMk6o=;
	b=mUAHpSDe5vwJdQY9l6sZeAk2lgqT5DpLCjmFgz1GUhptWNQayhaKmOijpzF/o9ofwSW5DW
	pyge/eVa9TtqbgVZZABH75+s35A1usJJxM598qydI69QU7d4XrqlJ0nCnPWWvUWz9g2FEg
	VqqiulBy7hdsxEqP7PKXoBotAFUaLxA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738581229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb5zq7frvFT+WumnDDdfbhccoEdy6xM1MzWPfZkMk6o=;
	b=gfgQoOeJQ0qHkNXb3JEyRqZSgwgohx8N90vSM19U1/nPs/2wJrOwXLRl3k+WqtJJ8xLI72
	R+X02e2rVLj5nGBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1738581224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb5zq7frvFT+WumnDDdfbhccoEdy6xM1MzWPfZkMk6o=;
	b=v+X5MjbEF6yXUgShsI+DJ1Kx59U7vtL2sZEakLCBVFoM3FM2M8+t7Crh3tGxiwN4qg543H
	twJcqNreRhPEz0BKxC3yyfXg32kDBssO9nU3hxaEN7hjdGTylSX6QII9h+vkqPz0wiNlyR
	fRwP3CF/88MxDGgXZz7pu03YUB6rQ0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1738581224;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb5zq7frvFT+WumnDDdfbhccoEdy6xM1MzWPfZkMk6o=;
	b=ziMobxZ1bAHhjHsi47Ie6TGIdL6cCZks+TvahnC+OTai6qirCg37OzGuLkjOhifDnWvD6B
	u8mhRdac0MQDqvCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D258013A96;
	Mon,  3 Feb 2025 11:13:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0C0VM+ikoGdNAwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 03 Feb 2025 11:13:44 +0000
From: Vlastimil Babka <vbabka@suse.cz>
Date: Mon, 03 Feb 2025 12:13:17 +0100
Subject: [PATCH v2 2/2] get_maintainer: stop reporting subsystem status as
 maintainer role
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-b4-get_maintainer-v2-2-83ba008b491f@suse.cz>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
In-Reply-To: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
To: Joe Perches <joe@perches.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Thorsten Leemhuis <linux@leemhuis.info>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2329; i=vbabka@suse.cz;
 h=from:subject:message-id; bh=e7rQ6ja5aEko/PdvDV9MQiOOrhtNYuMK/XWIlX2/Y64=;
 b=owEBbQGS/pANAwAIAbvgsHXSRYiaAcsmYgBnoKTljifJI1ftEE9Q4Cza4VPCM9k6VbLXxijZm
 5oWNvUM9zuJATMEAAEIAB0WIQR7u8hBFZkjSJZITfG74LB10kWImgUCZ6Ck5QAKCRC74LB10kWI
 mnbaB/0W5KCbtGSA0sLJyz6Rv5jvnVZnokyA67PMzu87/QlK9CgHPfk7kaQ6u6ll1LNdO+/TbTD
 Rvijhz9AfV0ou+JpvN7EK528jaeUADiubMqhREcsYjTUr+O7HIaYolsWPh9Ln24XmLZsEIvfhlF
 nb6wIE7e3rvXjsV0nZzcJkWVs6AI153NB8HpAxKACfsAP/Huv/Dc5+R9c1l7oxgbae36oyMGAUN
 daMkzU0mt3CNo+5OI7qUzcxKiMgw1ZHrbxizkBhjAk4DOtsuD4ciZV9QCtMVnnVJDHxd3jbTORA
 JVjPQDBf+iovUAEg5IO07p4TKdUE5JdQsWA+cgGz5KAZWfjr
X-Developer-Key: i=vbabka@suse.cz; a=openpgp;
 fpr=A940D434992C2E8E99103D50224FA7E7CC82A664
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

After introducing the --substatus option, we can stop adjusting the
reported maintainer role by the subsystem's status.

For compatibility with the --git-chief-penguins option, keep the "chief
penguin" role.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 scripts/get_maintainer.pl | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index da7fc70f17cd8d46b45da8db0b2029bb11b25af1..cf902417a52cccfd5dd00ac7d2fe43d9f43d2528 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1084,7 +1084,7 @@ version: $V
     --moderated => include moderated lists(s) if any (default: true)
     --s => include subscriber only list(s) if any (default: false)
     --remove-duplicates => minimize duplicate email names/addresses
-    --roles => show roles (status:subsystem, git-signer, list, etc...)
+    --roles => show roles (role:subsystem, git-signer, list, etc...)
     --rolestats => show roles and statistics (commits/total_commits, %)
     --substatus => show subsystem status if not Maintained (default: match --roles)"
     --file-emails => add email addresses found in -f file (default: 0 (off))
@@ -1298,8 +1298,9 @@ sub get_maintainer_role {
     my $start = find_starting_index($index);
     my $end = find_ending_index($index);
 
-    my $role = "unknown";
+    my $role = "maintainer";
     my $subsystem = get_subsystem_name($index);
+    my $status = "unknown";
 
     for ($i = $start + 1; $i < $end; $i++) {
 	my $tv = $typevalue[$i];
@@ -1307,23 +1308,13 @@ sub get_maintainer_role {
 	    my $ptype = $1;
 	    my $pvalue = $2;
 	    if ($ptype eq "S") {
-		$role = $pvalue;
+		$status = $pvalue;
 	    }
 	}
     }
 
-    $role = lc($role);
-    if      ($role eq "supported") {
-	$role = "supporter";
-    } elsif ($role eq "maintained") {
-	$role = "maintainer";
-    } elsif ($role eq "odd fixes") {
-	$role = "odd fixer";
-    } elsif ($role eq "orphan") {
-	$role = "orphan minder";
-    } elsif ($role eq "obsolete") {
-	$role = "obsolete minder";
-    } elsif ($role eq "buried alive in reporters") {
+    $status = lc($status);
+    if ($status eq "buried alive in reporters") {
 	$role = "chief penguin";
     }
 

-- 
2.48.1

