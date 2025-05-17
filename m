Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34D2940F;
	Sat, 17 May 2025 02:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747449262; cv=none; b=VWogRGvJpKWmiQnHOoIJjDpUJSDE8jY78bTs3fwUydlPAnQiSR8l+UKu3RQqp8qYWUl7eYiXIpqCMO+yR7Xoo3mg/yOy45c9zKpDIepBtlR3ajmk5dhmVlrPzRP9PbdfRx+7GHpyWEuT05/p3ZuklsG+rHHTeMRdN6iPHd1DY0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747449262; c=relaxed/simple;
	bh=iETPR42QaEtytfuv0q61ElwepwCEwWASA1OTwHBh/eM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRnDksFhs2Z0c9YOyWSRFRHg7LAh83drR6h1zNn/Eg33pX5BLjo9XRWFBTG77pLPKJR7lChOvhKA6E2s3B5FDa9/fPn9TrRfryY4iP8qDt5/5QwdqmFxsPPc3K9rRz5BBBufXs5xQdfHI2sluXo7sD8t3nZ4K/xrTEBsAi1+ZKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ScGk6mwT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XlQFNK5i; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ScGk6mwT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XlQFNK5i"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 179CA13800E4;
	Fri, 16 May 2025 22:34:17 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 16 May 2025 22:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1747449257; x=
	1747535657; bh=W6kB3UyFZitt+7gd9LRi3/C0t0XNRVsvLqHtoc5yCoM=; b=S
	cGk6mwTIcsqbL8dFljbDkHU8mcumpG5FRNvv+yfXyTC4E0OpTD4JuC99ibcF70Gm
	U0wzu7qTdTeTMaYIVTdUrYlFxDWiO8rFsVk2KRwk9rB+5idaa0zNGA2muEVN5ofa
	vooWMbp7PfNvf5V1paiUtWGX8ZPQzxzvLLDZALfowdkFrz0EPK5q79nck8duFFHi
	LUpDhO94XGVVi/KQhAZN9sKvPrkzAmRLVQ4LBHr2LdiBuALjOoDWiOc6jRcrg6KE
	CkyKH6d4EyAJ6waAuCsKcEA2bFWO6ou8AzTf60PP2VkJxb8AVYyoqvrY/YtemEXG
	ooPk8Od8AptlEuGVs0xHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1747449257; x=1747535657; bh=W
	6kB3UyFZitt+7gd9LRi3/C0t0XNRVsvLqHtoc5yCoM=; b=XlQFNK5iYKfc4oCRd
	NkomZ0ebJO0MmSO/dFd3q41Zb6s46Ra2EnadbzkBTi6tBVuOPS9jdV/lumVcnsby
	dgf3z7Y4+a/EejKlNALAvcdyuigsSgCoGL6lmEI8xIArpGouoykpC5662m9oadpQ
	SZwxasnxFtkYTv5Q2ccQVWzYWMTefyR4Z5KayIkxDuEZ7Y99g35lceVnDj1kGvGO
	0FvvvHakOC1S1Skg2s+Z2geluqMFPBZjUP7OjAZIEI5AzATuGGJYTciI0JR+qmb7
	FvVmz+N2qehnnDnYI7cLfifhcCj4eCckD2jyUB3RgTEb51RTnJfObnic0UEcsDQl
	ARSag==
X-ME-Sender: <xms:qPUnaO4RZLue4vdpzjBnhkL2NADQLKQquoOlmsyf7v2-tohNLFYn9A>
    <xme:qPUnaH6SFeV6w91BZRLSnjrtk6Evc9uc2qCh59r_hnGDqbpzQcbQ_11Zi3yb4aat4
    H0Cyi7XI9-nyhAZqgA>
X-ME-Received: <xmr:qPUnaNfrVDNcBE2RKww7U7G2s1dU-i595nbrXpDhcjNPD7qKHlQi6Gus5OSJjgIG-ncc_k6WQyFTVbkrgxuo78ZWjnsSTRn9hgqfvVBg5nkWom7knw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeggeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefu
    fffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhsohhnuc
    eomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthht
    vghrnhepvedtlefggefgjeettddvgfekhfeugfeutdekfeefudeuuddvieeutdeljedvhf
    dvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqh
    huvggssgdrtggrpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhrtghpth
    htohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdr
    jhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihgsmh
    dqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhr
    tghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopeguvggsrghrsghoshesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:qPUnaLIAI0iwgH1HYjrlZhfkap3-yzt9t8_yPgURZ6eLsy7HznzYBg>
    <xmx:qPUnaCL84mXNEsZXdqfOEhBrSc37zBEi5BAMAl9df7LAngrb0d1B-g>
    <xmx:qPUnaMyCaryYdMh7T-vVNumLPdJMa9iC5PKOEZGH0pRAwRAjQGMXKA>
    <xmx:qPUnaGKKitmMJx2AD_Vtf-3Ubv3a32ET6W1rLUKCpKzIcdsTMMMt7A>
    <xmx:qfUnaM2qtyft4pB8ma2ZIA_1h33EGXrjy97PehYwwhPXKJjSN0Gg4TdZ>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 May 2025 22:34:16 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Derek Barbosa <debarbos@redhat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Ignore battery threshold change event notification
Date: Fri, 16 May 2025 22:33:37 -0400
Message-ID: <20250517023348.2962591-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If user modifies the battery charge threshold an ACPI event is generated.
Confirmed with Lenovo FW team this is only generated on user event. As no
action is needed, ignore the event and prevent spurious kernel logs.

Reported-by: Derek Barbosa <debarbos@redhat.com>
Closes: https://lore.kernel.org/platform-driver-x86/7e9a1c47-5d9c-4978-af20-3949d53fb5dc@app.fastmail.com/T/#m5f5b9ae31d3fbf30d7d9a9d76c15fb3502dfd903
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/thinkpad_acpi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 92b21e49faf6..657625dd60a0 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -231,6 +231,7 @@ enum tpacpi_hkey_event_t {
 	/* Thermal events */
 	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
 	TP_HKEY_EV_ALARM_BAT_XHOT	= 0x6012, /* battery critically hot */
+	TP_HKEY_EV_ALARM_BAT_LIM_CHANGE	= 0x6013, /* battery charge limit changed*/
 	TP_HKEY_EV_ALARM_SENSOR_HOT	= 0x6021, /* sensor too hot */
 	TP_HKEY_EV_ALARM_SENSOR_XHOT	= 0x6022, /* sensor critically hot */
 	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* windows; thermal table changed */
@@ -3777,6 +3778,10 @@ static bool hotkey_notify_6xxx(const u32 hkey, bool *send_acpi_ev)
 		pr_alert("THERMAL EMERGENCY: battery is extremely hot!\n");
 		/* recommended action: immediate sleep/hibernate */
 		break;
+	case TP_HKEY_EV_ALARM_BAT_LIM_CHANGE:
+		pr_debug("Battery Info: battery charge threshold changed\n");
+		/* User changed charging threshold. No action needed */
+		return true;
 	case TP_HKEY_EV_ALARM_SENSOR_HOT:
 		pr_crit("THERMAL ALARM: a sensor reports something is too hot!\n");
 		/* recommended action: warn user through gui, that */
-- 
2.43.0

