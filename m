Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D468524B26
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749100122; cv=none; b=kptXfKIUGogwwCRNg5oCjZgBCY2GYWKBUMzqYGgiGG2skcnbDS57aLqXVmw4mL16Mes442hAos3D1ceAlSc4LBJSic2s/lQ2CH72xDs6DV8OORtC/gg3oyllQ7CKM0DXjQRmIAmdOmM3yk7/rUqyi8HDr98J5EY8/ycHJ0U5XcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749100122; c=relaxed/simple;
	bh=wQu6OhIbL7g01JSo2S203VelUJN0+hJwvR+5l7HVOGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4A3mwINdVjbeOQ8P8P+NR+jVhDbq+JEXmLDJrTsCy36cZydc+790G0dC8A/z3xs7UyMhJYo4DdvQylUUpkKctHz4GzKVM06R2xZXoHamCQWgOrQn6jMMOm0JAtmf/0EjkzY88JMrM4muJrLsHxC5ULW1wdnq7ymdfgj8HqIkGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLYmQU74; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLYmQU74"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74800b81f1bso548505b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 22:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749100120; x=1749704920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apgFwOObvt1HHcVpAIZQVYtRIRhRGZ6ybZ1Z4lONDxs=;
        b=nLYmQU74rdR0USNOT1us/uSUfA70Uz/S3x+/XWHD964yHTaEXotYcKxsbPknjzcwtE
         3FwqEm+Rj8k/x/j30z4qEdRWXVzfTQCcRkmRkcap1hWCd5GsWhzpAArXlecJC+yL1HyF
         fHGjdRI6juQG2nCqxk9bl4aIlG78QUnzsfRctXkebmdKC6aEzK/KOVI4f4JxfDyOIkOF
         Mp0wFobc5Uol8KpKiZKltYibfo4bKpo+y4pR5AwvEfVpaiZAa1CHR/dsm0CpyNsU3BcB
         OCLkPLt4dsuHwVpdAxP5mwpooWD/GuernrJQxy+bf9BSXQeJcGfP9OKGWNK9w23uKXtr
         HIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749100120; x=1749704920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apgFwOObvt1HHcVpAIZQVYtRIRhRGZ6ybZ1Z4lONDxs=;
        b=NFQFoQs7iAuEX0Fy89HVCVQ6EahGC8/CdyxTOLFLLdA7Jn9u70ZdH8mKRGgYJv4bja
         Onv1ijGNw9gRDJ/XTXIZtqUvVcw1f/VFQhbwJBMwkeqDqhF9XB95LzkIEpOwJyWNyLj2
         8luqdUHS2WOztJFIuuDX15KViIw+N8XTVCvX57jRXhBLROME5TsusFLahjHBFSzx2BO5
         3LtTO2zdJGDgNwUGoKeVZJ62Tm3oEF1yTV5olJQ+37SDwrgLdPFjll8AWkfJywuMl+mp
         6G+J6eUiZconbJ+PKo8UHgDava4vSNnD8mlkDtqVo07OVnZzu0zdXJCqzT2EtrCYl5aa
         JAUA==
X-Forwarded-Encrypted: i=1; AJvYcCVlK+PYubXXUpaAThAMkN3+cABePpFNfbxnUBTBKxI3dfHYNBKCEwdJvmbjuBD1bExsfMPtkN6qhOl45/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKqnBsBiCSd3TeoYKhvLfaSJgPay58r/OW5Iw1CgEBm6Ajhl1
	r1K2ojL6NjqwwXHhFVk+NiCVB6Tx1E4TK/QxeDXKTumr4VyI6+4jxWIt
X-Gm-Gg: ASbGnctw3RSHKdsLkAtIOSFQDdlZhOS68OgOAJ8iTPcR4ZcK7zG0/3+Bn/dCwOS7rvH
	Y7SLck/95xRfv5EGDFQ1QhEsftAAItS56QDoKfmkJCt+ZH6Lrpm41UfCl24Bdi8gcAR9rpTqMYC
	Ef0lHFmFgskRTGzcUq9XAd4JsJ3CrrVAxJDStHTGYkSIw9DQLURYmFDKfnZLWwgut23Aq2JQ4p+
	1AFapGXOiYsZBgFle2UHbeq17ttkxvS9TtLHcyJA9cDBYSbvuNdnYkSn0b+NV5Nt0YP0B5fa/Km
	PzSnvntYVYzUCAE0z7vQYMyNsngILqUH/v0sa8cHQ7Xl5hvrW27dkt4XHJuXjDC14dN3
X-Google-Smtp-Source: AGHT+IGfenh2yAlg9hxozEW6E/CDohy2WOExj1GBAOlcnLNCptcxRjrV/S9q4u5MVJo5QGyYjOj50w==
X-Received: by 2002:a05:6a00:3990:b0:740:6615:33c7 with SMTP id d2e1a72fcca58-7480b46a03dmr7983327b3a.23.1749100119882;
        Wed, 04 Jun 2025 22:08:39 -0700 (PDT)
Received: from ubuntu.. ([103.149.59.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed36b9sm12055253b3a.76.2025.06.04.22.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 22:08:39 -0700 (PDT)
From: Jagadeesh Yalapalli <jagadeesharm14@gmail.com>
To: jagadeesharm14@gmail.com
Cc: chris@the-brannons.com,
	jagadeesh.yalapalli@einfochips.com,
	kirk@reisers.ca,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	samuel.thibault@ens-lyon.org,
	speakup@linux-speakup.org,
	tglx@linutronix.de,
	w.d.hubbs@gmail.com
Subject: [PATCH v2] speakup: Standardize character attribute types to u16
Date: Thu,  5 Jun 2025 05:08:24 +0000
Message-ID: <20250605050828.17011-1-jagadeesharm14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604135846.46184-1-jagadeesharm14@gmail.com>
References: <20250604135846.46184-1-jagadeesharm14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>

This change replaces non-portable `u_short` types with standardized `u16`
throughout the speakup subsystem to ensure:
1. Consistent 16-bit width across all architectures.
2. Improved code portability and readability.
3. Elimination of platform-dependent type sizes.
4. Safe bitwise operations without sign-extension risks.

Signed-off-by: Jagadeesh Yalapalli <jagadeesh.yalapalli@einfochips.com>
---
 drivers/accessibility/speakup/keyhelp.c      | 10 +--
 drivers/accessibility/speakup/kobjects.c     |  4 +-
 drivers/accessibility/speakup/main.c         | 74 ++++++++++----------
 drivers/accessibility/speakup/selection.c    |  2 +-
 drivers/accessibility/speakup/speakup.h      | 10 +--
 drivers/accessibility/speakup/speakup_dtlk.h |  2 +-
 drivers/accessibility/speakup/spk_types.h    |  2 +-
 drivers/accessibility/speakup/synth.c        |  2 +-
 8 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/accessibility/speakup/keyhelp.c b/drivers/accessibility/speakup/keyhelp.c
index 822ceac83068..9c6e488adc2a 100644
--- a/drivers/accessibility/speakup/keyhelp.c
+++ b/drivers/accessibility/speakup/keyhelp.c
@@ -14,8 +14,8 @@
 #define MAXFUNCS 130
 #define MAXKEYS 256
 static const int num_key_names = MSG_KEYNAMES_END - MSG_KEYNAMES_START + 1;
-static u_short key_offsets[MAXFUNCS], key_data[MAXKEYS];
-static u_short masks[] = { 32, 16, 8, 4, 2, 1 };
+static u16 key_offsets[MAXFUNCS], key_data[MAXKEYS];
+static u16 masks[] = { 32, 16, 8, 4, 2, 1 };
 
 static short letter_offsets[26] = {
 	-1, -1, -1, -1, -1, -1, -1, -1,
@@ -49,7 +49,7 @@ static int cur_item, nstates;
 static void build_key_data(void)
 {
 	u_char *kp, counters[MAXFUNCS], ch, ch1;
-	u_short *p_key, key;
+	u16 *p_key, key;
 	int i, offset = 1;
 
 	nstates = (int)(state_tbl[-1]);
@@ -129,12 +129,12 @@ static int help_init(void)
 	return 0;
 }
 
-int spk_handle_help(struct vc_data *vc, u_char type, u_char ch, u_short key)
+int spk_handle_help(struct vc_data *vc, u_char type, u_char ch, u16 key)
 {
 	int i, n;
 	char *name;
 	u_char func, *kp;
-	u_short *p_keys, val;
+	u16 *p_keys, val;
 
 	if (letter_offsets[0] == -1)
 		help_init();
diff --git a/drivers/accessibility/speakup/kobjects.c b/drivers/accessibility/speakup/kobjects.c
index 0dfdb6608e02..3c3b1a4efbfe 100644
--- a/drivers/accessibility/speakup/kobjects.c
+++ b/drivers/accessibility/speakup/kobjects.c
@@ -120,7 +120,7 @@ static ssize_t chars_chartab_store(struct kobject *kobj,
 	ssize_t retval = count;
 	unsigned long flags;
 	unsigned long index = 0;
-	int charclass = 0;
+	u16 charclass = 0;
 	int received = 0;
 	int used = 0;
 	int rejected = 0;
@@ -461,7 +461,7 @@ static ssize_t punc_show(struct kobject *kobj, struct kobj_attribute *attr,
 	struct st_var_header *p_header;
 	struct punc_var_t *var;
 	struct st_bits_data *pb;
-	short mask;
+	u16 mask;
 	unsigned long flags;
 
 	p_header = spk_var_header_by_name(attr->attr.name);
diff --git a/drivers/accessibility/speakup/main.c b/drivers/accessibility/speakup/main.c
index e68cf1d83787..4e52607fa2be 100644
--- a/drivers/accessibility/speakup/main.c
+++ b/drivers/accessibility/speakup/main.c
@@ -63,7 +63,7 @@ int spk_attrib_bleep, spk_bleeps, spk_bleep_time = 10;
 int spk_no_intr, spk_spell_delay;
 int spk_key_echo, spk_say_word_ctl;
 int spk_say_ctrl, spk_bell_pos;
-short spk_punc_mask;
+u16 spk_punc_mask;
 int spk_punc_level, spk_reading_punc;
 int spk_cur_phonetic;
 char spk_str_caps_start[MAXVARLEN + 1] = "\0";
@@ -183,13 +183,13 @@ char *spk_default_chars[256] = {
 /* 251 */ "u circumflex", "u oomlaut", "y acute", "thorn", "y oomlaut"
 };
 
-/* array of 256 u_short (one for each character)
+/* array of 256 u16 (one for each character)
  * initialized to default_chartab and user selectable via
  * /sys/module/speakup/parameters/chartab
  */
-u_short spk_chartab[256];
+u16 spk_chartab[256];
 
-static u_short default_chartab[256] = {
+static u16 default_chartab[256] = {
 	B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL,	/* 0-7 */
 	B_CTL, B_CTL, A_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL,	/* 8-15 */
 	B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL, B_CTL,	/*16-23 */
@@ -267,10 +267,10 @@ static void speakup_date(struct vc_data *vc)
 	spk_y = spk_cy = vc->state.y;
 	spk_pos = spk_cp = vc->vc_pos;
 	spk_old_attr = spk_attr;
-	spk_attr = get_attributes(vc, (u_short *)spk_pos);
+	spk_attr = get_attributes(vc, (u16 *)spk_pos);
 }
 
-static void bleep(u_short val)
+static void bleep(u16 val)
 {
 	static const short vals[] = {
 		350, 370, 392, 414, 440, 466, 491, 523, 554, 587, 619, 659
@@ -346,14 +346,14 @@ static void speakup_cut(struct vc_data *vc)
 
 	if (!mark_cut_flag) {
 		mark_cut_flag = 1;
-		spk_xs = (u_short)spk_x;
-		spk_ys = (u_short)spk_y;
+		spk_xs = (u16)spk_x;
+		spk_ys = (u16)spk_y;
 		spk_sel_cons = vc;
 		synth_printf("%s\n", spk_msg_get(MSG_MARK));
 		return;
 	}
-	spk_xe = (u_short)spk_x;
-	spk_ye = (u_short)spk_y;
+	spk_xe = (u16)spk_x;
+	spk_ye = (u16)spk_y;
 	mark_cut_flag = 0;
 	synth_printf("%s\n", spk_msg_get(MSG_CUT));
 
@@ -482,7 +482,7 @@ static void say_char(struct vc_data *vc)
 	u16 ch;
 
 	spk_old_attr = spk_attr;
-	ch = get_char(vc, (u_short *)spk_pos, &spk_attr);
+	ch = get_char(vc, (u16 *)spk_pos, &spk_attr);
 	if (spk_attr != spk_old_attr) {
 		if (spk_attrib_bleep & 1)
 			bleep(spk_y);
@@ -497,7 +497,7 @@ static void say_phonetic_char(struct vc_data *vc)
 	u16 ch;
 
 	spk_old_attr = spk_attr;
-	ch = get_char(vc, (u_short *)spk_pos, &spk_attr);
+	ch = get_char(vc, (u16 *)spk_pos, &spk_attr);
 	if (ch <= 0x7f && isalpha(ch)) {
 		ch &= 0x1f;
 		synth_printf("%s\n", phonetic[--ch]);
@@ -549,7 +549,7 @@ static u_long get_word(struct vc_data *vc)
 	u_char temp;
 
 	spk_old_attr = spk_attr;
-	ch = get_char(vc, (u_short *)tmp_pos, &temp);
+	ch = get_char(vc, (u16 *)tmp_pos, &temp);
 
 /* decided to take out the sayword if on a space (mis-information */
 	if (spk_say_word_ctl && ch == SPACE) {
@@ -558,26 +558,26 @@ static u_long get_word(struct vc_data *vc)
 		return 0;
 	} else if (tmpx < vc->vc_cols - 2 &&
 		   (ch == SPACE || ch == 0 || (ch < 0x100 && IS_WDLM(ch))) &&
-		   get_char(vc, (u_short *)tmp_pos + 1, &temp) > SPACE) {
+		   get_char(vc, (u16 *)tmp_pos + 1, &temp) > SPACE) {
 		tmp_pos += 2;
 		tmpx++;
 	} else {
 		while (tmpx > 0) {
-			ch = get_char(vc, (u_short *)tmp_pos - 1, &temp);
+			ch = get_char(vc, (u16 *)tmp_pos - 1, &temp);
 			if ((ch == SPACE || ch == 0 ||
 			     (ch < 0x100 && IS_WDLM(ch))) &&
-			    get_char(vc, (u_short *)tmp_pos, &temp) > SPACE)
+			    get_char(vc, (u16 *)tmp_pos, &temp) > SPACE)
 				break;
 			tmp_pos -= 2;
 			tmpx--;
 		}
 	}
-	attr_ch = get_char(vc, (u_short *)tmp_pos, &spk_attr);
+	attr_ch = get_char(vc, (u16 *)tmp_pos, &spk_attr);
 	buf[cnt++] = attr_ch;
 	while (tmpx < vc->vc_cols - 1 && cnt < ARRAY_SIZE(buf) - 1) {
 		tmp_pos += 2;
 		tmpx++;
-		ch = get_char(vc, (u_short *)tmp_pos, &temp);
+		ch = get_char(vc, (u16 *)tmp_pos, &temp);
 		if (ch == SPACE || ch == 0 ||
 		    (buf[cnt - 1] < 0x100 && IS_WDLM(buf[cnt - 1]) &&
 		     ch > SPACE))
@@ -591,7 +591,7 @@ static u_long get_word(struct vc_data *vc)
 static void say_word(struct vc_data *vc)
 {
 	u_long cnt = get_word(vc);
-	u_short saved_punc_mask = spk_punc_mask;
+	u16 saved_punc_mask = spk_punc_mask;
 
 	if (cnt == 0)
 		return;
@@ -606,7 +606,7 @@ static void say_prev_word(struct vc_data *vc)
 	u_char temp;
 	u16 ch;
 	enum edge edge_said = edge_none;
-	u_short last_state = 0, state = 0;
+	u16 last_state = 0, state = 0;
 
 	spk_parked |= 0x01;
 
@@ -635,7 +635,7 @@ static void say_prev_word(struct vc_data *vc)
 			spk_x--;
 		}
 		spk_pos -= 2;
-		ch = get_char(vc, (u_short *)spk_pos, &temp);
+		ch = get_char(vc, (u16 *)spk_pos, &temp);
 		if (ch == SPACE || ch == 0)
 			state = 0;
 		else if (ch < 0x100 && IS_WDLM(ch))
@@ -661,7 +661,7 @@ static void say_next_word(struct vc_data *vc)
 	u_char temp;
 	u16 ch;
 	enum edge edge_said = edge_none;
-	u_short last_state = 2, state = 0;
+	u16 last_state = 2, state = 0;
 
 	spk_parked |= 0x01;
 	if (spk_x == vc->vc_cols - 1 && spk_y == vc->vc_rows - 1) {
@@ -669,7 +669,7 @@ static void say_next_word(struct vc_data *vc)
 		return;
 	}
 	while (1) {
-		ch = get_char(vc, (u_short *)spk_pos, &temp);
+		ch = get_char(vc, (u16 *)spk_pos, &temp);
 		if (ch == SPACE || ch == 0)
 			state = 0;
 		else if (ch < 0x100 && IS_WDLM(ch))
@@ -755,9 +755,9 @@ static int get_line(struct vc_data *vc)
 	u_char tmp2;
 
 	spk_old_attr = spk_attr;
-	spk_attr = get_attributes(vc, (u_short *)spk_pos);
+	spk_attr = get_attributes(vc, (u16 *)spk_pos);
 	for (i = 0; i < vc->vc_cols; i++) {
-		buf[i] = get_char(vc, (u_short *)tmp, &tmp2);
+		buf[i] = get_char(vc, (u16 *)tmp, &tmp2);
 		tmp += 2;
 	}
 	for (--i; i >= 0; i--)
@@ -770,7 +770,7 @@ static void say_line(struct vc_data *vc)
 {
 	int i = get_line(vc);
 	u16 *cp;
-	u_short saved_punc_mask = spk_punc_mask;
+	u16 saved_punc_mask = spk_punc_mask;
 
 	if (i == 0) {
 		synth_printf("%s\n", spk_msg_get(MSG_BLANK));
@@ -817,12 +817,12 @@ static int say_from_to(struct vc_data *vc, u_long from, u_long to,
 {
 	int i = 0;
 	u_char tmp;
-	u_short saved_punc_mask = spk_punc_mask;
+	u16 saved_punc_mask = spk_punc_mask;
 
 	spk_old_attr = spk_attr;
-	spk_attr = get_attributes(vc, (u_short *)from);
+	spk_attr = get_attributes(vc, (u16 *)from);
 	while (from < to) {
-		buf[i++] = get_char(vc, (u_short *)from, &tmp);
+		buf[i++] = get_char(vc, (u16 *)from, &tmp);
 		from += 2;
 		if (i >= vc->vc_size_row)
 			break;
@@ -895,10 +895,10 @@ static int get_sentence_buf(struct vc_data *vc, int read_punc)
 	sentmarks[bn][0] = &sentbuf[bn][0];
 	i = 0;
 	spk_old_attr = spk_attr;
-	spk_attr = get_attributes(vc, (u_short *)start);
+	spk_attr = get_attributes(vc, (u16 *)start);
 
 	while (start < end) {
-		sentbuf[bn][i] = get_char(vc, (u_short *)start, &tmp);
+		sentbuf[bn][i] = get_char(vc, (u16 *)start, &tmp);
 		if (i > 0) {
 			if (sentbuf[bn][i] == SPACE &&
 			    sentbuf[bn][i - 1] == '.' &&
@@ -1047,7 +1047,7 @@ static void say_position(struct vc_data *vc)
 static void say_char_num(struct vc_data *vc)
 {
 	u_char tmp;
-	u16 ch = get_char(vc, (u_short *)spk_pos, &tmp);
+	u16 ch = get_char(vc, (u16 *)spk_pos, &tmp);
 
 	synth_printf(spk_msg_get(MSG_CHAR_INFO), ch, ch);
 }
@@ -1080,7 +1080,7 @@ static void spkup_write(const u16 *in_buf, int count)
 {
 	static int rep_count;
 	static u16 ch = '\0', old_ch = '\0';
-	static u_short char_type, last_type;
+	static u16 char_type, last_type;
 	int in_count = count;
 
 	spk_keydown = 0;
@@ -1325,9 +1325,9 @@ void spk_reset_default_chartab(void)
 
 static const struct st_bits_data *pb_edit;
 
-static int edit_bits(struct vc_data *vc, u_char type, u_char ch, u_short key)
+static int edit_bits(struct vc_data *vc, u_char type, u_char ch, u16 key)
 {
-	short mask = pb_edit->mask, ch_type = spk_chartab[ch];
+	u16 mask = pb_edit->mask, ch_type = spk_chartab[ch];
 
 	if (type != KT_LATIN || (ch_type & B_NUM) || ch < SPACE)
 		return -1;
@@ -1947,7 +1947,7 @@ static void speakup_bits(struct vc_data *vc)
 	spk_special_handler = edit_bits;
 }
 
-static int handle_goto(struct vc_data *vc, u_char type, u_char ch, u_short key)
+static int handle_goto(struct vc_data *vc, u_char type, u_char ch, u16 key)
 {
 	static u_char goto_buf[8];
 	static int num;
@@ -2105,7 +2105,7 @@ static void do_spkup(struct vc_data *vc, u_char value)
 static const char *pad_chars = "0123456789+-*/\015,.?()";
 
 static int
-speakup_key(struct vc_data *vc, int shift_state, int keycode, u_short keysym,
+speakup_key(struct vc_data *vc, int shift_state, int keycode, u16 keysym,
 	    int up_flag)
 {
 	unsigned long flags;
diff --git a/drivers/accessibility/speakup/selection.c b/drivers/accessibility/speakup/selection.c
index 7df7afad5ab4..1713ce4e0ba5 100644
--- a/drivers/accessibility/speakup/selection.c
+++ b/drivers/accessibility/speakup/selection.c
@@ -13,7 +13,7 @@
 
 #include "speakup.h"
 
-unsigned short spk_xs, spk_ys, spk_xe, spk_ye; /* our region points */
+u16 spk_xs, spk_ys, spk_xe, spk_ye; /* our region points */
 struct vc_data *spk_sel_cons;
 
 struct speakup_selection_work {
diff --git a/drivers/accessibility/speakup/speakup.h b/drivers/accessibility/speakup/speakup.h
index 54f1226ea061..984a729fd82d 100644
--- a/drivers/accessibility/speakup/speakup.h
+++ b/drivers/accessibility/speakup/speakup.h
@@ -62,7 +62,7 @@ int spk_set_num_var(int val, struct st_var_header *var, int how);
 int spk_set_string_var(const char *page, struct st_var_header *var, int len);
 int spk_set_mask_bits(const char *input, const int which, const int how);
 extern special_func spk_special_handler;
-int spk_handle_help(struct vc_data *vc, u_char type, u_char ch, u_short key);
+int spk_handle_help(struct vc_data *vc, u_char type, u_char ch, u16 key);
 int synth_init(char *name);
 void synth_release(void);
 
@@ -82,7 +82,7 @@ void synth_writeu(const char *buf, size_t count);
 int synth_supports_indexing(void);
 
 extern struct vc_data *spk_sel_cons;
-extern unsigned short spk_xs, spk_ys, spk_xe, spk_ye; /* our region points */
+extern u16 spk_xs, spk_ys, spk_xe, spk_ye; /* our region points */
 
 extern wait_queue_head_t speakup_event;
 extern struct kobject *speakup_kobj;
@@ -95,20 +95,20 @@ extern struct st_spk_t *speakup_console[];
 extern struct spk_synth *synth;
 extern char spk_pitch_buff[];
 extern u_char *spk_our_keys[];
-extern short spk_punc_masks[];
+extern u16 spk_punc_masks[];
 extern char spk_str_caps_start[], spk_str_caps_stop[], spk_str_pause[];
 extern bool spk_paused;
 extern const struct st_bits_data spk_punc_info[];
 extern u_char spk_key_buf[600];
 extern char *spk_characters[];
 extern char *spk_default_chars[];
-extern u_short spk_chartab[];
+extern u16 spk_chartab[];
 extern int spk_no_intr, spk_say_ctrl, spk_say_word_ctl, spk_punc_level;
 extern int spk_reading_punc, spk_attrib_bleep, spk_bleeps;
 extern int spk_bleep_time, spk_bell_pos;
 extern int spk_spell_delay, spk_key_echo;
 extern int spk_cur_phonetic;
-extern short spk_punc_mask;
+extern u16 spk_punc_mask;
 extern short spk_pitch_shift, synth_flags;
 extern bool spk_quiet_boot;
 extern char *synth_name;
diff --git a/drivers/accessibility/speakup/speakup_dtlk.h b/drivers/accessibility/speakup/speakup_dtlk.h
index 9c378b58066e..4190c7badeaf 100644
--- a/drivers/accessibility/speakup/speakup_dtlk.h
+++ b/drivers/accessibility/speakup/speakup_dtlk.h
@@ -39,7 +39,7 @@
 
 				/* data returned by Interrogate command */
 struct synth_settings {
-	u_short serial_number;	/* 0-7Fh:0-7Fh */
+	u16 serial_number;	/* 0-7Fh:0-7Fh */
 	u_char rom_version[24]; /* null terminated string */
 	u_char mode;		/* 0=Character; 1=Phoneme; 2=Text */
 	u_char punc_level;	/* nB; 0-7 */
diff --git a/drivers/accessibility/speakup/spk_types.h b/drivers/accessibility/speakup/spk_types.h
index 08011518a28a..a5762330e249 100644
--- a/drivers/accessibility/speakup/spk_types.h
+++ b/drivers/accessibility/speakup/spk_types.h
@@ -53,7 +53,7 @@ enum var_id_t {
 };
 
 typedef int (*special_func)(struct vc_data *vc, u_char type, u_char ch,
-		u_short key);
+		u16 key);
 
 #define COLOR_BUFFER_SIZE 160
 
diff --git a/drivers/accessibility/speakup/synth.c b/drivers/accessibility/speakup/synth.c
index d8addbf3ad0d..d1ec1a7eb160 100644
--- a/drivers/accessibility/speakup/synth.c
+++ b/drivers/accessibility/speakup/synth.c
@@ -574,4 +574,4 @@ struct spk_synth *synth_current(void)
 }
 EXPORT_SYMBOL_GPL(synth_current);
 
-short spk_punc_masks[] = { 0, SOME, MOST, PUNC, PUNC | B_SYM };
+u16 spk_punc_masks[] = { 0, SOME, MOST, PUNC, PUNC | B_SYM };
-- 
2.43.0

