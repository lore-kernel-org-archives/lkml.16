Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2648289800
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976235; cv=none; b=eQq92flmXq5bkKieYDQsXE9/EsDK09pZ7j7EhuTOHulmU+K+7SWTUmi54R6ZNR4oIo9ZwK1eirGr864wGyOMj2bCh8OjfZKiUi9wiXMsejPl/vaPAh9oXb8ITeMRb8m4A76Q3z+hgSeG8XoeNxBs6VupdXTul+Ti9/DB2kOxlmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976235; c=relaxed/simple;
	bh=Qh9Dxn1evd1IaoF2kKXcp+Uncn/nb5PU20RpJf21dfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxuRrKujqt+QORl4srnsBN4Ttw0Pku/Gw/wjGlSMKt+4h2ZC+92E6ATaL4GAiFQW/H71rSOASUfS9dmWoJJa1hCb8q6a438Q2YYKuaZ5/0/QHRZBoPOvbmMqDxuqDcG9I0VMXdqy0N6zTyFivSwHkucYmSA71I4dbofRB/YnZ6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+ES2Bim; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+ES2Bim"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a361b8a664so5764326f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976232; x=1749581032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/IGAXxz13MqEbH+PXFjdEnFfsqBlovXRPcKg3pDAzSE=;
        b=X+ES2BimH61N+TEP5PErqUFXL6PsuTk19ryQWk4s/CD0AIHqLWqed1x61GBvRBYIBk
         H8H/G2UgwVA0bEWq+reEr1X4QuuZK7JgfS3FqkTbb3jpuKljoh9/k3WR+V095GGwaycp
         JWGMwUrPAfFHIqeOXlFefXmiUHzlVrr6f+t6CtLg+8Wtw8H5NF53YoQFD833SL06D12S
         CeAlII9dX+5HW7yR7ZhV49EkOQCCVTR4bFtLLDwuvPYSD7BTv9ayJldp3doJ7vylP/rO
         Iy8PHAUfzuqaYMNMnr7wWzy8FOw2WuWtLeh5QP7IYcFEJ2igHPwuLS/3QpCGbcoy6tMB
         Wgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976232; x=1749581032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/IGAXxz13MqEbH+PXFjdEnFfsqBlovXRPcKg3pDAzSE=;
        b=pCoZndXEF+rkbHFU/6uNX7uCRLVnNMbeAvmk+s1hlxNAKGChuZDWlzq7BaSimeTFZx
         uPR3j28SbDSUkPlWlCaLm6Ef0lTxSBpESkz+JFPnzBJjmdLlD8p0acC++/NfmfHY+Lqe
         qqFKC7zJEkmIgbOFBzoRzlYdCzXqPu1NRMmzbE5nJ+2ZYTpP61HHOllwgbp7LaUDejMD
         f0Wb7pIauNJBkO4D2UHOjKJlL/9YUnKmezf2kAgdXof4svaWkkrB23s2ACetrHqnO2yJ
         6IWdMjruxd0cDs6pepYNSi38xDAjc7HdKG4cenmJ21lSEpEokeXWol+jQ/vmaGc4nXEk
         40UA==
X-Forwarded-Encrypted: i=1; AJvYcCVuel96svIfrkbzHA3WRP9Ax2hJ/TXSZz9W7BEZtKLxv1R/9CJCtQd0Rtsnc1t1tSCNtBSLlOjhcQIimfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1gidfsyiAcHt+idLbQ8OVu/fht0EPpfhOhUlVBy9pskk0szEQ
	fAQf6fITTWI59L5iMbohNRZDbLLtS2nE6CPX1WvnQVQBfZXpoYKyqs/k
X-Gm-Gg: ASbGncuKHpcNpquorTcurwZ24W/BTWSVDbQWzgze1/rQNCsm+fAbnnXF5/Ek2mGzLO4
	K6X+3sfJHJLvEJsc9kgKv08QXKAMfOFqNW5XYpMIhaBmXYW1tiewnIbrDE2ul3ggK7YuqaxeaG7
	y680EaOkIxxDi+aTTZ20fH6f8lg9Pn2CgZ2KRVtSKoodBX6RqLLOzpvMVrDgjRnzmfxAKPJ0zF4
	iJfB0IRs8Ud65dOwXBesF4PW5GLqaw4HKCgj5ra1vliQltu/Uspk6syX4e77pQMaSG6ya79Odwy
	NtH1n1GUoK3xiLCh1i1GCkKEwAHZijofCV3hkqvQXuavagna66uoNmmOufpxqWsjQVHrsHaawfp
	0KCNXAvV29x4=
X-Google-Smtp-Source: AGHT+IGtZlug9Tz9tkgitUZDAPYu1Yoz8QMGQhWJvbQqWZMlTuZ1W9twlmq82Xd5Az+rq0ec8jOshA==
X-Received: by 2002:a05:6000:22ca:b0:3a4:e841:ee76 with SMTP id ffacd0b85a97d-3a4f7a9d5cdmr13579712f8f.37.1748976231788;
        Tue, 03 Jun 2025 11:43:51 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm18449959f8f.49.2025.06.03.11.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:43:51 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/4] staging: gpib: Remove unneeded enums and functions
Date: Tue,  3 Jun 2025 20:43:17 +0200
Message-ID: <20250603184320.30594-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603184320.30594-1-dpenkler@gmail.com>
References: <20250603184320.30594-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove enums and functions that do not need to be shared
with user space.

Remove enums and functions that are not needed in the kernel drivers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h | 198 -------------------------------
 1 file changed, 198 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index 41500cee4029..ddf82a4d989f 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -83,204 +83,12 @@ enum bus_control_line {
 	BUS_EOI = 0x8000		/* EOI	line status bit */
 };
 
-/* Possible GPIB command messages */
-
-enum cmd_byte {
-	GTL = 0x1,	/* go to local			*/
-	SDC = 0x4,	/* selected device clear	*/
-	PP_CONFIG = 0x5,
-#ifndef PPC
-	PPC = PP_CONFIG, /* parallel poll configure	*/
-#endif
-	GET = 0x8,	/* group execute trigger	*/
-	TCT = 0x9,	/* take control			*/
-	LLO = 0x11,	/* local lockout		*/
-	DCL = 0x14,	/* device clear			*/
-	PPU = 0x15,	/* parallel poll unconfigure	*/
-	SPE = 0x18,	/* serial poll enable		*/
-	SPD = 0x19,	/* serial poll disable		*/
-	CFE = 0x1f, /* configure enable */
-	LAD = 0x20,	/* value to be 'ored' in to obtain listen address */
-	UNL = 0x3F,	/* unlisten			*/
-	TAD = 0x40,	/* value to be 'ored' in to obtain talk address	  */
-	UNT = 0x5F,	/* untalk			*/
-	SAD = 0x60,	/* my secondary address (base) */
-	PPE = 0x60,	/* parallel poll enable (base)	*/
-	PPD = 0x70	/* parallel poll disable	*/
-};
-
 enum ppe_bits {
 	PPC_DISABLE = 0x10,
 	PPC_SENSE = 0x8,	/* parallel poll sense bit	*/
 	PPC_DIO_MASK = 0x7
 };
 
-/* confine address to range 0 to 30. */
-static inline unsigned int gpib_address_restrict(unsigned int addr)
-{
-	addr &= 0x1f;
-	if (addr == 0x1f)
-		addr = 0;
-	return addr;
-}
-
-static inline __u8 MLA(unsigned int addr)
-{
-	return gpib_address_restrict(addr) | LAD;
-}
-
-static inline __u8 MTA(unsigned int addr)
-{
-	return gpib_address_restrict(addr) | TAD;
-}
-
-static inline __u8 MSA(unsigned int addr)
-{
-	return (addr & 0x1f) | SAD;
-}
-
-static inline __u8 PPE_byte(unsigned int dio_line, int sense)
-{
-	__u8 cmd;
-
-	cmd = PPE;
-	if (sense)
-		cmd |= PPC_SENSE;
-	cmd |= (dio_line - 1) & 0x7;
-	return cmd;
-}
-
-/* mask of bits that actually matter in a command byte */
-enum {
-	gpib_command_mask = 0x7f,
-};
-
-static inline int is_PPE(__u8 command)
-{
-	return (command & 0x70) == 0x60;
-}
-
-static inline int is_PPD(__u8 command)
-{
-	return (command & 0x70) == 0x70;
-}
-
-static inline int in_addressed_command_group(__u8 command)
-{
-	return (command & 0x70) == 0x0;
-}
-
-static inline int in_universal_command_group(__u8 command)
-{
-	return (command & 0x70) == 0x10;
-}
-
-static inline int in_listen_address_group(__u8 command)
-{
-	return (command & 0x60) == 0x20;
-}
-
-static inline int in_talk_address_group(__u8 command)
-{
-	return (command & 0x60) == 0x40;
-}
-
-static inline int in_primary_command_group(__u8 command)
-{
-	return in_addressed_command_group(command) ||
-		in_universal_command_group(command) ||
-		in_listen_address_group(command) ||
-		in_talk_address_group(command);
-}
-
-static inline int gpib_address_equal(unsigned int pad1, int sad1, unsigned int pad2, int sad2)
-{
-	if (pad1 == pad2) {
-		if (sad1 == sad2)
-			return 1;
-		if (sad1 < 0 && sad2 < 0)
-			return 1;
-	}
-
-	return 0;
-}
-
-enum ibask_option {
-	IBA_PAD = 0x1,
-	IBA_SAD = 0x2,
-	IBA_TMO = 0x3,
-	IBA_EOT = 0x4,
-	IBA_PPC = 0x5,	/* board only */
-	IBA_READ_DR = 0x6,	/* device only */
-	IBA_AUTOPOLL = 0x7,	/* board only */
-	IBA_CICPROT = 0x8,	/* board only */
-	IBA_IRQ = 0x9,	/* board only */
-	IBA_SC = 0xa,	/* board only */
-	IBA_SRE = 0xb,	/* board only */
-	IBA_EOS_RD = 0xc,
-	IBA_EOS_WRT = 0xd,
-	IBA_EOS_CMP = 0xe,
-	IBA_EOS_CHAR = 0xf,
-	IBA_PP2 = 0x10,	/* board only */
-	IBA_TIMING = 0x11,	/* board only */
-	IBA_DMA = 0x12,	/* board only */
-	IBA_READ_ADJUST = 0x13,
-	IBA_WRITE_ADJUST = 0x14,
-	IBA_EVENT_QUEUE = 0x15,	/* board only */
-	IBA_SPOLL_BIT = 0x16,	/* board only */
-	IBA_SEND_LLO = 0x17,	/* board only */
-	IBA_SPOLL_TIME = 0x18,	/* device only */
-	IBA_PPOLL_TIME = 0x19,	/* board only */
-	IBA_END_BIT_IS_NORMAL = 0x1a,
-	IBA_UN_ADDR = 0x1b,	/* device only */
-	IBA_HS_CABLE_LENGTH = 0x1f,	/* board only */
-	IBA_IST = 0x20,	/* board only */
-	IBA_RSV = 0x21,	/* board only */
-	IBA_BNA = 0x200,	/* device only */
-	/* linux-gpib extensions */
-	IBA_7_BIT_EOS = 0x1000	/* board only. Returns 1 if board supports 7 bit eos compares*/
-};
-
-enum ibconfig_option {
-	IBC_PAD = 0x1,
-	IBC_SAD = 0x2,
-	IBC_TMO = 0x3,
-	IBC_EOT = 0x4,
-	IBC_PPC = 0x5,	/* board only */
-	IBC_READDR = 0x6,	/* device only */
-	IBC_AUTOPOLL = 0x7,	/* board only */
-	IBC_CICPROT = 0x8,	/* board only */
-	IBC_IRQ = 0x9,	/* board only */
-	IBC_SC = 0xa,	/* board only */
-	IBC_SRE = 0xb,	/* board only */
-	IBC_EOS_RD = 0xc,
-	IBC_EOS_WRT = 0xd,
-	IBC_EOS_CMP = 0xe,
-	IBC_EOS_CHAR = 0xf,
-	IBC_PP2 = 0x10,	/* board only */
-	IBC_TIMING = 0x11,	/* board only */
-	IBC_DMA = 0x12,	/* board only */
-	IBC_READ_ADJUST = 0x13,
-	IBC_WRITE_ADJUST = 0x14,
-	IBC_EVENT_QUEUE = 0x15,	/* board only */
-	IBC_SPOLL_BIT = 0x16,	/* board only */
-	IBC_SEND_LLO = 0x17,	/* board only */
-	IBC_SPOLL_TIME = 0x18,	/* device only */
-	IBC_PPOLL_TIME = 0x19,	/* board only */
-	IBC_END_BIT_IS_NORMAL = 0x1a,
-	IBC_UN_ADDR = 0x1b,	/* device only */
-	IBC_HS_CABLE_LENGTH = 0x1f,	/* board only */
-	IBC_IST = 0x20,	/* board only */
-	IBC_RSV = 0x21,	/* board only */
-	IBC_BNA = 0x200	/* device only */
-};
-
-enum t1_delays {
-	T1_DELAY_2000ns = 1,
-	T1_DELAY_500ns = 2,
-	T1_DELAY_350ns = 3
-};
-
 enum {
 	request_service_bit = 0x40,
 };
@@ -292,11 +100,5 @@ enum gpib_events {
 	EVENT_IFC = 3
 };
 
-enum gpib_stb {
-	IB_STB_RQS = 0x40, /* IEEE 488.1 & 2  */
-	IB_STB_ESB = 0x20, /* IEEE 488.2 only */
-	IB_STB_MAV = 0x10	 /* IEEE 488.2 only */
-};
-
 #endif	/* _GPIB_H */
 
-- 
2.49.0

