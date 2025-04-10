Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1791028A403;
	Thu, 10 Apr 2025 13:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290335; cv=none; b=pCyOGtUZQ5v90cGxpgL1mko0OBCnFen4XoNzK3BPtzXVNqktMZLer2t3oBDneauHHQgHDNqUzlmWsmtBbKfen/LuaSyueAdafygyoRj6LhgPPK1FlIdoa0vs5ZVTFVWxgSPyh7Seb6wvUVHF6nb3Wbe705UrRAuEbEvRrBa9ywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290335; c=relaxed/simple;
	bh=U+NdL3Uok4E5swNFbxk2aaFc+aN6tSLetnL1vOzDlnA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cKE2yTIvNJgYV77ESDeqTXGYkUUpeTI9CZlFGS1dsxTkHkRC6ARccKc4iPe2vsSfbUPg4/a437UE8tItGS90Aw5Ho+C2wwnX9bYs+er6ztF1IyX/CohEzbLHV3mQWJC4dBvTFJ9ek0dG2IlEc/1Pb6INHDOB651WyD4DsY/aPAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=BnYrBz8R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W1FiHWxX; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="BnYrBz8R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W1FiHWxX"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BFD9425401FD;
	Thu, 10 Apr 2025 09:05:26 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Thu, 10 Apr 2025 09:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744290326;
	 x=1744376726; bh=NHurAmfHUHUOmL7XUC6RQJpOSSL17rD55W5SHMQI/3w=; b=
	BnYrBz8ReR4DmRmv+VYz3d/YOWKhwacAf3qbsQf4CXfMGwN4DYiCt1ncf7QcfXfb
	3fU4oLLrnCz45QDi25XqGqQavuzVK/MlAXfm55YkNFsnbFXDOxb+svPOHESdlLkV
	ibJO/H8cYK91YTgoxP5+PyAI+TbARR1iJ11e4/iLWSx+4eRI7rqtsBUo2jaXcxAn
	hU/MwbgS0WD/4vt5btfeJQiz8QFDK0Tw27K7FEm5DSq9zrshRPKXhqql59tdjkHN
	NQzI9XDKWxxlFDJkJJzkdDKHkUqQ3m9c2Cb5SzObO+nS906zt2dGKz8dAN4h+8SE
	3eWRGInHOcN9aTn35e8qjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744290326; x=
	1744376726; bh=NHurAmfHUHUOmL7XUC6RQJpOSSL17rD55W5SHMQI/3w=; b=W
	1FiHWxXK5ot29wAE86KsHGqQ2k6rVIV1WUiCo02GW3iC9HMXKaHyL2dSe8xltHSG
	xB1s33l1dnM0xbqMdr1oVRvs9cEyeHxElVVhRW63lXEYh4iHwlirTYwR6E+W/11E
	DT2dmcOdd3tlnGj9ngi+rTzEdjBjY71mGKPREBhrfhoGy8ajdlfm23xvHMlOjgtz
	Ujgr5Ttgyc3jsfxlADB2zQXCDNUaY1ZjbJn/r3c1Ojy7b5H2vx4K0QoEDU6lK/Be
	51nX5Yfiu8CLzNvlyojCvpEDtWVbcu1fLGyzHWcqVEnLRPL1rHuQXiXuL80MZ+ay
	hyL4ovTCl1J2RlVeg9DAw==
X-ME-Sender: <xms:FcL3ZzXc6goCwgBdEaTFr9ap8HWV1OhPb1PsZPisQnOM4Us1rn0cig>
    <xme:FcL3Z7l8qeY7VIrKT1OlHqfhjOpxzcxB7xo5DXIFBb6aFlZdHXthrQAVzqdzYVmgC
    i_dA_hiup0FCkvo3xY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovh
    estggrmhgsrhhiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtoheplhhoghgrnhhgsegu
    vghlthgrthgvvgdrtghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhise
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnugho
    nhhishesghhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepughinhhguhihvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    humheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrihgthhgr
    rhgusehnohgurdgrth
X-ME-Proxy: <xmx:FcL3Z_aoJNw2Pr_I6q6-XZ0Z3aP_WqFrcDT6sLYyY3hf7PmuWh10jw>
    <xmx:FcL3Z-VgFAcrK-dxqHpC_qxYfAD4UkI5S9hv3B9kpX7mzREbR90AVQ>
    <xmx:FcL3Z9nDGngXOXuNzZ8Y0vywY5t9envuFc7eXDtI_KzUAuu-dgAg5Q>
    <xmx:FcL3Z7f1TGoi9k_ZYa96susldsqGXr8I_JETDjv5Bk30RLiAyISqRQ>
    <xmx:FsL3Z0S-vHcRbQAKYCwFjr4P57seZuv59eo7G3SPF7n7idUlf0xmz8cb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 268022220073; Thu, 10 Apr 2025 09:05:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tbf81c49526c64944
Date: Thu, 10 Apr 2025 15:05:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 "Logan Gunthorpe" <logang@deltatee.com>,
 "Stephen Bates" <sbates@raithlin.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Dinh Nguyen" <dinguyen@kernel.org>
Message-Id: <115f0e3d-da77-4059-8468-96741bbe7f81@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdXk+MfwPtm_whA2nWde0t_Ft=n=4xCO9hqAm-yuS+He5w@mail.gmail.com>
References: <20250409061129.136788-1-fujita.tomonori@gmail.com>
 <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
 <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>
 <ab0490cc-ce86-4492-a088-fd2ae03f1475@app.fastmail.com>
 <CAMuHMdXk+MfwPtm_whA2nWde0t_Ft=n=4xCO9hqAm-yuS+He5w@mail.gmail.com>
Subject: Re: [PATCH v1] um: fix incompatible argument type in iounmap()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Apr 10, 2025, at 09:30, Geert Uytterhoeven wrote:
> On Wed, 9 Apr 2025 at 21:07, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Apr 9, 2025, at 19:07, Geert Uytterhoeven wrote:
>> > On Wed, 9 Apr 2025 at 16:48, Miguel Ojeda
>
>> In theory we could go through all the old drivers and
>> also remove the 'volatile' markers from struct members that
>> store __iomem pointers, but there is no practical benefit to
>> that.
>
> Most drivers must have been fixed already, as m68k allmodconfig
> does not complain.  Still, I guess I should update m68k to match the
> others, right? (FTR, that also builds fine)
>

Right, it's even rarer than I expected. According to my randconfig
builds, these  re the ones that actually have the extra volatile
annotations:

 drivers/media/pci/bt8xx/bt878.c                 |   2 +-
 drivers/media/pci/bt8xx/bt878.h                 |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.h            |   8 +-
 drivers/media/pci/ivtv/ivtv-firmware.c          |  10 +-
 drivers/mtd/devices/spear_smi.c                 |   2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.h       |   5 +-
 drivers/scsi/aacraid/aacraid.h                  |   5 +-
 drivers/scsi/aacraid/rx.c                       |   2 +-
 drivers/scsi/megaraid/megaraid_sas.h            |   2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c       |   2 +-
 drivers/scsi/mpi3mr/mpi3mr.h                    |   2 +-
 drivers/scsi/smartpqi/smartpqi_init.c           |   2 +-
 drivers/video/fbdev/imsttfb.c                   |   4 +-
 drivers/video/fbdev/kyro/STG4000InitDevice.c    |   4 +-
 drivers/video/fbdev/kyro/STG4000Interface.h     |  26 +-
 drivers/video/fbdev/kyro/STG4000OverlayDevice.c |  10 +-
 drivers/video/fbdev/kyro/STG4000Ramdac.c        |   6 +-
 drivers/video/fbdev/kyro/STG4000Reg.h           | 376 ++++++++++++------------
 drivers/video/fbdev/kyro/STG4000VTG.c           |   8 +-
 drivers/video/fbdev/nvidia/nv_type.h            |  38 +--
 drivers/video/fbdev/nvidia/nvidia.c             |   9 +-
 drivers/video/fbdev/riva/fbdev.c                |   2 +-
 drivers/video/fbdev/riva/nv_driver.c            |  26 +-
 drivers/video/fbdev/riva/riva_hw.h              |  60 ++--
 include/asm-generic/io.h                        | 136 ++++-----
 include/asm-generic/video.h                     |  22 +-
 include/linux/io-64-nonatomic-hi-lo.h           |  12 +-
 include/linux/io-64-nonatomic-lo-hi.h           |  12 +-
 include/linux/io.h                              |   2 +-
 lib/check_signature.c                           |   2 +-
 lib/iomem_copy.c                                |   6 +-
 lib/trace_readwrite.c                           |   8 +-
 mm/ioremap.c                                    |   4 +-
 33 files changed, 404 insertions(+), 413 deletions(-)
diff --git a/drivers/media/pci/bt8xx/bt878.c b/drivers/media/pci/bt8xx/bt878.c
index 62a6c4a80bed..dc4885d03838 100644
--- a/drivers/media/pci/bt8xx/bt878.c
+++ b/drivers/media/pci/bt8xx/bt878.c
@@ -442,7 +442,7 @@ static int bt878_probe(struct pci_dev *dev, const struct pci_device_id *pci_id)
 	       bt->irq, lat, bt->bt878_adr);
 
 #ifdef __sparc__
-	bt->bt878_mem = (unsigned char *) bt->bt878_adr;
+	bt->bt878_mem = (unsigned char __iomem *) bt->bt878_adr;
 #else
 	bt->bt878_mem = ioremap(bt->bt878_adr, 0x1000);
 #endif
diff --git a/drivers/media/pci/bt8xx/bt878.h b/drivers/media/pci/bt8xx/bt878.h
index 5b1c7f56e553..1f03019af187 100644
--- a/drivers/media/pci/bt8xx/bt878.h
+++ b/drivers/media/pci/bt8xx/bt878.h
@@ -103,7 +103,7 @@ struct bt878 {
 	unsigned char revision;
 	unsigned int irq;
 	unsigned long bt878_adr;
-	volatile void __iomem *bt878_mem; /* function 1 */
+	void __iomem *bt878_mem; /* function 1 */
 
 	volatile u32 finished_block;
 	volatile u32 last_block;
diff --git a/drivers/media/pci/ivtv/ivtv-driver.h b/drivers/media/pci/ivtv/ivtv-driver.h
index a6ffa99e16bc..24225b4ecbf3 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.h
+++ b/drivers/media/pci/ivtv/ivtv-driver.h
@@ -210,7 +210,7 @@ struct ivtv_api_cache {
 };
 
 struct ivtv_mailbox_data {
-	volatile struct ivtv_mailbox __iomem *mbox;
+	struct ivtv_mailbox __iomem *mbox;
 	/* Bits 0-2 are for the encoder mailboxes, 0-1 are for the decoder mailboxes.
 	   If the bit is set, then the corresponding mailbox is in use by the driver. */
 	unsigned long busy;
@@ -623,9 +623,9 @@ struct ivtv {
 	struct v4l2_subdev *sd_audio;	/* controlling audio subdev */
 	struct v4l2_subdev *sd_muxer;	/* controlling audio muxer subdev */
 	resource_size_t base_addr;      /* PCI resource base address */
-	volatile void __iomem *enc_mem; /* pointer to mapped encoder memory */
-	volatile void __iomem *dec_mem; /* pointer to mapped decoder memory */
-	volatile void __iomem *reg_mem; /* pointer to mapped registers */
+	void __iomem *enc_mem;		/* pointer to mapped encoder memory */
+	void __iomem *dec_mem;		/* pointer to mapped decoder memory */
+	void __iomem *reg_mem;		/* pointer to mapped registers */
 	struct ivtv_options options;	/* user options */
 
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/pci/ivtv/ivtv-firmware.c b/drivers/media/pci/ivtv/ivtv-firmware.c
index 56b25255faf5..abac1fa5a1ab 100644
--- a/drivers/media/pci/ivtv/ivtv-firmware.c
+++ b/drivers/media/pci/ivtv/ivtv-firmware.c
@@ -37,7 +37,7 @@
 #define IVTV_FW_ENC_SIZE		(376836)
 #define IVTV_FW_DEC_SIZE		(256*1024)
 
-static int load_fw_direct(const char *fn, volatile u8 __iomem *mem, struct ivtv *itv, long size)
+static int load_fw_direct(const char *fn, u8 __iomem *mem, struct ivtv *itv, long size)
 {
 	const struct firmware *fw = NULL;
 	int retries = 3;
@@ -45,7 +45,7 @@ static int load_fw_direct(const char *fn, volatile u8 __iomem *mem, struct ivtv
 retry:
 	if (retries && request_firmware(&fw, fn, &itv->pdev->dev) == 0) {
 		int i;
-		volatile u32 __iomem *dst = (volatile u32 __iomem *)mem;
+		u32 __iomem *dst = (u32 __iomem *)mem;
 		const u32 *src = (const u32 *)fw->data;
 
 		if (fw->size != size) {
@@ -163,7 +163,7 @@ static int ivtv_firmware_copy(struct ivtv *itv)
 	return 0;
 }
 
-static volatile struct ivtv_mailbox __iomem *ivtv_search_mailbox(const volatile u8 __iomem *mem, u32 size)
+static struct ivtv_mailbox __iomem *ivtv_search_mailbox(const u8 __iomem *mem, u32 size)
 {
 	int i;
 
@@ -174,7 +174,7 @@ static volatile struct ivtv_mailbox __iomem *ivtv_search_mailbox(const volatile
 		    readl(mem + i + 4)  == 0x34567812 &&
 		    readl(mem + i + 8)  == 0x56781234 &&
 		    readl(mem + i + 12) == 0x78123456) {
-			return (volatile struct ivtv_mailbox __iomem *)(mem + i + 16);
+			return (struct ivtv_mailbox __iomem *)(mem + i + 16);
 		}
 	}
 	return NULL;
@@ -233,7 +233,7 @@ void ivtv_init_mpeg_decoder(struct ivtv *itv)
 {
 	u32 data[CX2341X_MBOX_MAX_DATA];
 	long readbytes;
-	volatile u8 __iomem *mem_offset;
+	u8 __iomem *mem_offset;
 
 	data[0] = 0;
 	data[1] = itv->cxhdl.width;	/* YUV source width */
diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index f02f96bff450..f6d6795dcdfd 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -599,7 +599,7 @@ static int spear_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
  * implementation detail and not part of the API. Not mentioning the comment
  * stating that _memcpy_toio() should be optimized.
  */
-static void spear_smi_memcpy_toio_b(volatile void __iomem *dest,
+static void spear_smi_memcpy_toio_b(void __iomem *dest,
 				    const void *src, size_t len)
 {
 	const unsigned char *from = src;
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.h b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
index 21726cf56586..b9d77bdc4369 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.h
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.h
@@ -2804,8 +2804,7 @@ static inline u32 bnxt_tx_avail(struct bnxt *bp,
 	return bp->tx_ring_size - (used & bp->tx_ring_mask);
 }
 
-static inline void bnxt_writeq(struct bnxt *bp, u64 val,
-			       volatile void __iomem *addr)
+static inline void bnxt_writeq(struct bnxt *bp, u64 val, void __iomem *addr)
 {
 #if BITS_PER_LONG == 32
 	spin_lock(&bp->db_lock);
@@ -2817,7 +2816,7 @@ static inline void bnxt_writeq(struct bnxt *bp, u64 val,
 }
 
 static inline void bnxt_writeq_relaxed(struct bnxt *bp, u64 val,
-				       volatile void __iomem *addr)
+				       void __iomem *addr)
 {
 #if BITS_PER_LONG == 32
 	spin_lock(&bp->db_lock);
diff --git a/drivers/scsi/aacraid/aacraid.h b/drivers/scsi/aacraid/aacraid.h
index 8c384c25dca1..6385483a4a70 100644
--- a/drivers/scsi/aacraid/aacraid.h
+++ b/drivers/scsi/aacraid/aacraid.h
@@ -1627,8 +1627,9 @@ struct aac_dev
 			char __iomem *bar1;
 		} src;
 	} regs;
-	volatile void __iomem *base, *dbg_base_mapped;
-	volatile struct rx_inbound __iomem *IndexRegs;
+	void __iomem *base;
+	void __iomem *dbg_base_mapped;
+	struct rx_inbound __iomem *IndexRegs;
 	u32			OIMR; /* Mask Register Cache */
 	/*
 	 *	AIF thread states
diff --git a/drivers/scsi/aacraid/rx.c b/drivers/scsi/aacraid/rx.c
index e06ff83b69ce..60abddaa2f87 100644
--- a/drivers/scsi/aacraid/rx.c
+++ b/drivers/scsi/aacraid/rx.c
@@ -423,7 +423,7 @@ static int aac_rx_deliver_message(struct fib * fib)
 	struct aac_queue *q = &dev->queues->queue[AdapNormCmdQueue];
 	u32 Index;
 	u64 addr;
-	volatile void __iomem *device;
+	void __iomem *device;
 
 	unsigned long count = 10000000L; /* 50 seconds */
 	atomic_inc(&q->numpending);
diff --git a/drivers/scsi/megaraid/megaraid_sas.h b/drivers/scsi/megaraid/megaraid_sas.h
index 8ee2bfe47571..319ed4518d5c 100644
--- a/drivers/scsi/megaraid/megaraid_sas.h
+++ b/drivers/scsi/megaraid/megaraid_sas.h
@@ -2741,7 +2741,7 @@ int megasas_adp_reset_wait_for_ready(struct megasas_instance *instance,
 int megasas_irqpoll(struct irq_poll *irqpoll, int budget);
 void megasas_dump_fusion_io(struct scsi_cmnd *scmd);
 u32 megasas_readl(struct megasas_instance *instance,
-		  const volatile void __iomem *addr);
+		  const void __iomem *addr);
 struct megasas_cmd *megasas_get_cmd(struct megasas_instance *instance);
 void megasas_return_cmd(struct megasas_instance *instance,
 			struct megasas_cmd *cmd);
diff --git a/drivers/scsi/megaraid/megaraid_sas_base.c b/drivers/scsi/megaraid/megaraid_sas_base.c
index 5e33d411fa3d..de6ff8542b7d 100644
--- a/drivers/scsi/megaraid/megaraid_sas_base.c
+++ b/drivers/scsi/megaraid/megaraid_sas_base.c
@@ -254,7 +254,7 @@ static inline void
 megasas_init_ctrl_params(struct megasas_instance *instance);
 
 u32 megasas_readl(struct megasas_instance *instance,
-		  const volatile void __iomem *addr)
+		  const void __iomem *addr)
 {
 	u32 i = 0, ret_val;
 	/*
diff --git a/drivers/scsi/mpi3mr/mpi3mr.h b/drivers/scsi/mpi3mr/mpi3mr.h
index 9bbc7cb98ca3..bf272dd69d23 100644
--- a/drivers/scsi/mpi3mr/mpi3mr.h
+++ b/drivers/scsi/mpi3mr/mpi3mr.h
@@ -1185,7 +1185,7 @@ struct mpi3mr_ioc {
 	char name[MPI3MR_NAME_LENGTH];
 	char driver_name[MPI3MR_NAME_LENGTH];
 
-	volatile struct mpi3_sysif_registers __iomem *sysif_regs;
+	struct mpi3_sysif_registers __iomem *sysif_regs;
 	resource_size_t sysif_regs_phys;
 	int bars;
 	u64 dma_mask;
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index 8a26eca4fdc9..02aebbbfc081 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -3933,7 +3933,7 @@ static inline void pqi_configure_legacy_intx(struct pqi_ctrl_info *ctrl_info, bo
 {
 	u32 intx_mask;
 	struct pqi_device_registers __iomem *pqi_registers;
-	volatile void __iomem *register_addr;
+	void __iomem *register_addr;
 
 	pqi_registers = ctrl_info->pqi_registers;
 
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index dc4e659e06af..0434367120ba 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -402,7 +402,7 @@ static void imsttfb_remove(struct pci_dev *pdev);
 /*
  * Register access
  */
-static inline u32 read_reg_le32(volatile u32 __iomem *base, int regindex)
+static inline u32 read_reg_le32(u32 __iomem *base, int regindex)
 {
 #ifdef __powerpc__
 	return in_le32(base + regindex);
@@ -411,7 +411,7 @@ static inline u32 read_reg_le32(volatile u32 __iomem *base, int regindex)
 #endif
 }
 
-static inline void write_reg_le32(volatile u32 __iomem *base, int regindex, u32 val)
+static inline void write_reg_le32(u32 __iomem *base, int regindex, u32 val)
 {
 #ifdef __powerpc__
 	out_le32(base + regindex, val);
diff --git a/drivers/video/fbdev/kyro/STG4000InitDevice.c b/drivers/video/fbdev/kyro/STG4000InitDevice.c
index 79886a246638..94ebf10668de 100644
--- a/drivers/video/fbdev/kyro/STG4000InitDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000InitDevice.c
@@ -80,7 +80,7 @@ volatile u32 i,count=0; \
     for(i=0;i<X;i++) count++; \
 }
 
-static u32 InitSDRAMRegisters(volatile STG4000REG __iomem *pSTGReg,
+static u32 InitSDRAMRegisters(STG4000REG __iomem *pSTGReg,
 			      u32 dwSubSysID, u32 dwRevID)
 {
 	static const u8 adwSDRAMArgCfg0[] = { 0xa0, 0x80, 0xa0, 0xa0, 0xa0 };
@@ -238,7 +238,7 @@ u32 ProgramClock(u32 refClock,
 	return (ulBestClk);
 }
 
-int SetCoreClockPLL(volatile STG4000REG __iomem *pSTGReg, struct pci_dev *pDev)
+int SetCoreClockPLL(STG4000REG __iomem *pSTGReg, struct pci_dev *pDev)
 {
 	u32 F, R, P;
 	u16 core_pll = 0, sub;
diff --git a/drivers/video/fbdev/kyro/STG4000Interface.h b/drivers/video/fbdev/kyro/STG4000Interface.h
index b7c83d5dfb13..1caa9a8ed85b 100644
--- a/drivers/video/fbdev/kyro/STG4000Interface.h
+++ b/drivers/video/fbdev/kyro/STG4000Interface.h
@@ -17,45 +17,45 @@
 /*
  * Ramdac Setup
  */
-extern int InitialiseRamdac(volatile STG4000REG __iomem *pSTGReg, u32 displayDepth,
+extern int InitialiseRamdac(STG4000REG __iomem *pSTGReg, u32 displayDepth,
 			    u32 displayWidth, u32 displayHeight,
 			    s32 HSyncPolarity, s32 VSyncPolarity,
 			    u32 *pixelClock);
 
-extern void DisableRamdacOutput(volatile STG4000REG __iomem *pSTGReg);
-extern void EnableRamdacOutput(volatile STG4000REG __iomem *pSTGReg);
+extern void DisableRamdacOutput(STG4000REG __iomem *pSTGReg);
+extern void EnableRamdacOutput(STG4000REG __iomem *pSTGReg);
 
 /*
  * Timing generator setup
  */
-extern void DisableVGA(volatile STG4000REG __iomem *pSTGReg);
-extern void StopVTG(volatile STG4000REG __iomem *pSTGReg);
-extern void StartVTG(volatile STG4000REG __iomem *pSTGReg);
-extern void SetupVTG(volatile STG4000REG __iomem *pSTGReg,
+extern void DisableVGA(STG4000REG __iomem *pSTGReg);
+extern void StopVTG(STG4000REG __iomem *pSTGReg);
+extern void StartVTG(STG4000REG __iomem *pSTGReg);
+extern void SetupVTG(STG4000REG __iomem *pSTGReg,
 		     const struct kyrofb_info * pTiming);
 
 extern u32 ProgramClock(u32 refClock, u32 coreClock, u32 *FOut, u32 *ROut, u32 *POut);
-extern int SetCoreClockPLL(volatile STG4000REG __iomem *pSTGReg, struct pci_dev *pDev);
+extern int SetCoreClockPLL(STG4000REG __iomem *pSTGReg, struct pci_dev *pDev);
 
 /*
  * Overlay setup
  */
-extern void ResetOverlayRegisters(volatile STG4000REG __iomem *pSTGReg);
+extern void ResetOverlayRegisters(STG4000REG __iomem *pSTGReg);
 
-extern int CreateOverlaySurface(volatile STG4000REG __iomem *pSTGReg,
+extern int CreateOverlaySurface(STG4000REG __iomem *pSTGReg,
 				u32 ulWidth, u32 ulHeight,
 				int bLinear,
 				u32 ulOverlayOffset,
 				u32 * retStride, u32 * retUVStride);
 
-extern int SetOverlayBlendMode(volatile STG4000REG __iomem *pSTGReg,
+extern int SetOverlayBlendMode(STG4000REG __iomem *pSTGReg,
 			       OVRL_BLEND_MODE mode,
 			       u32 ulAlpha, u32 ulColorKey);
 
-extern int SetOverlayViewPort(volatile STG4000REG __iomem *pSTGReg,
+extern int SetOverlayViewPort(STG4000REG __iomem *pSTGReg,
 			      u32 left, u32 top,
 			      u32 right, u32 bottom);
 
-extern void EnableOverlayPlane(volatile STG4000REG __iomem *pSTGReg);
+extern void EnableOverlayPlane(STG4000REG __iomem *pSTGReg);
 
 #endif /* _STG4000INTERFACE_H */
diff --git a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
index 9fde0e3b69ec..0971aa857ee5 100644
--- a/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
+++ b/drivers/video/fbdev/kyro/STG4000OverlayDevice.c
@@ -76,7 +76,7 @@ typedef struct _OVRL_SRC_DEST {
 static u32 ovlWidth, ovlHeight, ovlStride;
 static int ovlLinear;
 
-void ResetOverlayRegisters(volatile STG4000REG __iomem *pSTGReg)
+void ResetOverlayRegisters(STG4000REG __iomem *pSTGReg)
 {
 	u32 tmp;
 
@@ -137,7 +137,7 @@ void ResetOverlayRegisters(volatile STG4000REG __iomem *pSTGReg)
 
 }
 
-int CreateOverlaySurface(volatile STG4000REG __iomem *pSTGReg,
+int CreateOverlaySurface(STG4000REG __iomem *pSTGReg,
 			 u32 inWidth,
 			 u32 inHeight,
 			 int bLinear,
@@ -239,7 +239,7 @@ int CreateOverlaySurface(volatile STG4000REG __iomem *pSTGReg,
 	return 0;
 }
 
-int SetOverlayBlendMode(volatile STG4000REG __iomem *pSTGReg,
+int SetOverlayBlendMode(STG4000REG __iomem *pSTGReg,
 			OVRL_BLEND_MODE mode,
 			u32 ulAlpha, u32 ulColorKey)
 {
@@ -285,7 +285,7 @@ int SetOverlayBlendMode(volatile STG4000REG __iomem *pSTGReg,
 	return 0;
 }
 
-void EnableOverlayPlane(volatile STG4000REG __iomem *pSTGReg)
+void EnableOverlayPlane(STG4000REG __iomem *pSTGReg)
 {
 	u32 tmp;
 	/* Enable Overlay */
@@ -314,7 +314,7 @@ static u32 Overlap(u32 ulBits, u32 ulPattern)
 
 }
 
-int SetOverlayViewPort(volatile STG4000REG __iomem *pSTGReg,
+int SetOverlayViewPort(STG4000REG __iomem *pSTGReg,
 		       u32 left, u32 top,
 		       u32 right, u32 bottom)
 {
diff --git a/drivers/video/fbdev/kyro/STG4000Ramdac.c b/drivers/video/fbdev/kyro/STG4000Ramdac.c
index e6ad037e4396..fb974cb13c19 100644
--- a/drivers/video/fbdev/kyro/STG4000Ramdac.c
+++ b/drivers/video/fbdev/kyro/STG4000Ramdac.c
@@ -19,7 +19,7 @@
 static u32 STG_PIXEL_BUS_WIDTH = 128;	/* 128 bit bus width      */
 static u32 REF_CLOCK = 14318;
 
-int InitialiseRamdac(volatile STG4000REG __iomem * pSTGReg,
+int InitialiseRamdac(STG4000REG __iomem * pSTGReg,
 		     u32 displayDepth,
 		     u32 displayWidth,
 		     u32 displayHeight,
@@ -144,7 +144,7 @@ int InitialiseRamdac(volatile STG4000REG __iomem * pSTGReg,
 }
 
 /* Ramdac control, turning output to the screen on and off */
-void DisableRamdacOutput(volatile STG4000REG __iomem * pSTGReg)
+void DisableRamdacOutput(STG4000REG __iomem * pSTGReg)
 {
 	u32 tmp;
 
@@ -153,7 +153,7 @@ void DisableRamdacOutput(volatile STG4000REG __iomem * pSTGReg)
 	STG_WRITE_REG(DACStreamCtrl, tmp);
 }
 
-void EnableRamdacOutput(volatile STG4000REG __iomem * pSTGReg)
+void EnableRamdacOutput(STG4000REG __iomem * pSTGReg)
 {
 	u32 tmp;
 
diff --git a/drivers/video/fbdev/kyro/STG4000Reg.h b/drivers/video/fbdev/kyro/STG4000Reg.h
index 50f4670e9252..c470e92d5b8d 100644
--- a/drivers/video/fbdev/kyro/STG4000Reg.h
+++ b/drivers/video/fbdev/kyro/STG4000Reg.h
@@ -73,210 +73,210 @@ typedef enum _OVRL_PIX_FORMAT {
 /* Register Table */
 typedef struct {
 	/* 0h  */
-	volatile u32 Thread0Enable;	/* 0x0000 */
-	volatile u32 Thread1Enable;	/* 0x0004 */
-	volatile u32 Thread0Recover;	/* 0x0008 */
-	volatile u32 Thread1Recover;	/* 0x000C */
-	volatile u32 Thread0Step;	/* 0x0010 */
-	volatile u32 Thread1Step;	/* 0x0014 */
-	volatile u32 VideoInStatus;	/* 0x0018 */
-	volatile u32 Core2InSignStart;	/* 0x001C */
-	volatile u32 Core1ResetVector;	/* 0x0020 */
-	volatile u32 Core1ROMOffset;	/* 0x0024 */
-	volatile u32 Core1ArbiterPriority;	/* 0x0028 */
-	volatile u32 VideoInControl;	/* 0x002C */
-	volatile u32 VideoInReg0CtrlA;	/* 0x0030 */
-	volatile u32 VideoInReg0CtrlB;	/* 0x0034 */
-	volatile u32 VideoInReg1CtrlA;	/* 0x0038 */
-	volatile u32 VideoInReg1CtrlB;	/* 0x003C */
-	volatile u32 Thread0Kicker;	/* 0x0040 */
-	volatile u32 Core2InputSign;	/* 0x0044 */
-	volatile u32 Thread0ProgCtr;	/* 0x0048 */
-	volatile u32 Thread1ProgCtr;	/* 0x004C */
-	volatile u32 Thread1Kicker;	/* 0x0050 */
-	volatile u32 GPRegister1;	/* 0x0054 */
-	volatile u32 GPRegister2;	/* 0x0058 */
-	volatile u32 GPRegister3;	/* 0x005C */
-	volatile u32 GPRegister4;	/* 0x0060 */
-	volatile u32 SerialIntA;	/* 0x0064 */
-
-	volatile u32 Fill0[6];	/* GAP 0x0068 - 0x007C */
-
-	volatile u32 SoftwareReset;	/* 0x0080 */
-	volatile u32 SerialIntB;	/* 0x0084 */
-
-	volatile u32 Fill1[37];	/* GAP 0x0088 - 0x011C */
-
-	volatile u32 ROMELQV;	/* 0x011C */
-	volatile u32 WLWH;	/* 0x0120 */
-	volatile u32 ROMELWL;	/* 0x0124 */
-
-	volatile u32 dwFill_1;	/* GAP 0x0128 */
-
-	volatile u32 IntStatus;	/* 0x012C */
-	volatile u32 IntMask;	/* 0x0130 */
-	volatile u32 IntClear;	/* 0x0134 */
-
-	volatile u32 Fill2[6];	/* GAP 0x0138 - 0x014C */
-
-	volatile u32 ROMGPIOA;	/* 0x0150 */
-	volatile u32 ROMGPIOB;	/* 0x0154 */
-	volatile u32 ROMGPIOC;	/* 0x0158 */
-	volatile u32 ROMGPIOD;	/* 0x015C */
-
-	volatile u32 Fill3[2];	/* GAP 0x0160 - 0x0168 */
-
-	volatile u32 AGPIntID;	/* 0x0168 */
-	volatile u32 AGPIntClassCode;	/* 0x016C */
-	volatile u32 AGPIntBIST;	/* 0x0170 */
-	volatile u32 AGPIntSSID;	/* 0x0174 */
-	volatile u32 AGPIntPMCSR;	/* 0x0178 */
-	volatile u32 VGAFrameBufBase;	/* 0x017C */
-	volatile u32 VGANotify;	/* 0x0180 */
-	volatile u32 DACPLLMode;	/* 0x0184 */
-	volatile u32 Core1VideoClockDiv;	/* 0x0188 */
-	volatile u32 AGPIntStat;	/* 0x018C */
+	u32 Thread0Enable;	/* 0x0000 */
+	u32 Thread1Enable;	/* 0x0004 */
+	u32 Thread0Recover;	/* 0x0008 */
+	u32 Thread1Recover;	/* 0x000C */
+	u32 Thread0Step;	/* 0x0010 */
+	u32 Thread1Step;	/* 0x0014 */
+	u32 VideoInStatus;	/* 0x0018 */
+	u32 Core2InSignStart;	/* 0x001C */
+	u32 Core1ResetVector;	/* 0x0020 */
+	u32 Core1ROMOffset;	/* 0x0024 */
+	u32 Core1ArbiterPriority;/* 0x0028 */
+	u32 VideoInControl;	/* 0x002C */
+	u32 VideoInReg0CtrlA;	/* 0x0030 */
+	u32 VideoInReg0CtrlB;	/* 0x0034 */
+	u32 VideoInReg1CtrlA;	/* 0x0038 */
+	u32 VideoInReg1CtrlB;	/* 0x003C */
+	u32 Thread0Kicker;	/* 0x0040 */
+	u32 Core2InputSign;	/* 0x0044 */
+	u32 Thread0ProgCtr;	/* 0x0048 */
+	u32 Thread1ProgCtr;	/* 0x004C */
+	u32 Thread1Kicker;	/* 0x0050 */
+	u32 GPRegister1;	/* 0x0054 */
+	u32 GPRegister2;	/* 0x0058 */
+	u32 GPRegister3;	/* 0x005C */
+	u32 GPRegister4;	/* 0x0060 */
+	u32 SerialIntA;		/* 0x0064 */
+
+	u32 Fill0[6];		/* GAP 0x0068 - 0x007C */
+
+	u32 SoftwareReset;	/* 0x0080 */
+	u32 SerialIntB;		/* 0x0084 */
+
+	u32 Fill1[37];		/* GAP 0x0088 - 0x011C */
+
+	u32 ROMELQV;		/* 0x011C */
+	u32 WLWH;		/* 0x0120 */
+	u32 ROMELWL;		/* 0x0124 */
+
+	u32 dwFill_1;		/* GAP 0x0128 */
+
+	u32 IntStatus;		/* 0x012C */
+	u32 IntMask;		/* 0x0130 */
+	u32 IntClear;		/* 0x0134 */
+
+	u32 Fill2[6];		/* GAP 0x0138 - 0x014C */
+
+	u32 ROMGPIOA;		/* 0x0150 */
+	u32 ROMGPIOB;		/* 0x0154 */
+	u32 ROMGPIOC;		/* 0x0158 */
+	u32 ROMGPIOD;		/* 0x015C */
+
+	u32 Fill3[2];		/* GAP 0x0160 - 0x0168 */
+
+	u32 AGPIntID;		/* 0x0168 */
+	u32 AGPIntClassCode;	/* 0x016C */
+	u32 AGPIntBIST;		/* 0x0170 */
+	u32 AGPIntSSID;		/* 0x0174 */
+	u32 AGPIntPMCSR;	/* 0x0178 */
+	u32 VGAFrameBufBase;	/* 0x017C */
+	u32 VGANotify;		/* 0x0180 */
+	u32 DACPLLMode;		/* 0x0184 */
+	u32 Core1VideoClockDiv;	/* 0x0188 */
+	u32 AGPIntStat;		/* 0x018C */
 
 	/*
-	   volatile u32 Fill4[0x0400/4 - 0x0190/4]; //GAP 0x0190 - 0x0400
-	   volatile u32 Fill5[0x05FC/4 - 0x0400/4]; //GAP 0x0400 - 0x05FC Fog Table
-	   volatile u32 Fill6[0x0604/4 - 0x0600/4]; //GAP 0x0600 - 0x0604
-	   volatile u32 Fill7[0x0680/4 - 0x0608/4]; //GAP 0x0608 - 0x0680
-	   volatile u32 Fill8[0x07FC/4 - 0x0684/4]; //GAP 0x0684 - 0x07FC
+	   u32 Fill4[0x0400/4 - 0x0190/4]; //GAP 0x0190 - 0x0400
+	   u32 Fill5[0x05FC/4 - 0x0400/4]; //GAP 0x0400 - 0x05FC Fog Table
+	   u32 Fill6[0x0604/4 - 0x0600/4]; //GAP 0x0600 - 0x0604
+	   u32 Fill7[0x0680/4 - 0x0608/4]; //GAP 0x0608 - 0x0680
+	   u32 Fill8[0x07FC/4 - 0x0684/4]; //GAP 0x0684 - 0x07FC
 	 */
-	volatile u32 Fill4[412];	/* 0x0190 - 0x07FC */
-
-	volatile u32 TACtrlStreamBase;	/* 0x0800 */
-	volatile u32 TAObjDataBase;	/* 0x0804 */
-	volatile u32 TAPtrDataBase;	/* 0x0808 */
-	volatile u32 TARegionDataBase;	/* 0x080C */
-	volatile u32 TATailPtrBase;	/* 0x0810 */
-	volatile u32 TAPtrRegionSize;	/* 0x0814 */
-	volatile u32 TAConfiguration;	/* 0x0818 */
-	volatile u32 TAObjDataStartAddr;	/* 0x081C */
-	volatile u32 TAObjDataEndAddr;	/* 0x0820 */
-	volatile u32 TAXScreenClip;	/* 0x0824 */
-	volatile u32 TAYScreenClip;	/* 0x0828 */
-	volatile u32 TARHWClamp;	/* 0x082C */
-	volatile u32 TARHWCompare;	/* 0x0830 */
-	volatile u32 TAStart;	/* 0x0834 */
-	volatile u32 TAObjReStart;	/* 0x0838 */
-	volatile u32 TAPtrReStart;	/* 0x083C */
-	volatile u32 TAStatus1;	/* 0x0840 */
-	volatile u32 TAStatus2;	/* 0x0844 */
-	volatile u32 TAIntStatus;	/* 0x0848 */
-	volatile u32 TAIntMask;	/* 0x084C */
-
-	volatile u32 Fill5[235];	/* GAP 0x0850 - 0x0BF8 */
-
-	volatile u32 TextureAddrThresh;	/* 0x0BFC */
-	volatile u32 Core1Translation;	/* 0x0C00 */
-	volatile u32 TextureAddrReMap;	/* 0x0C04 */
-	volatile u32 RenderOutAGPRemap;	/* 0x0C08 */
-	volatile u32 _3DRegionReadTrans;	/* 0x0C0C */
-	volatile u32 _3DPtrReadTrans;	/* 0x0C10 */
-	volatile u32 _3DParamReadTrans;	/* 0x0C14 */
-	volatile u32 _3DRegionReadThresh;	/* 0x0C18 */
-	volatile u32 _3DPtrReadThresh;	/* 0x0C1C */
-	volatile u32 _3DParamReadThresh;	/* 0x0C20 */
-	volatile u32 _3DRegionReadAGPRemap;	/* 0x0C24 */
-	volatile u32 _3DPtrReadAGPRemap;	/* 0x0C28 */
-	volatile u32 _3DParamReadAGPRemap;	/* 0x0C2C */
-	volatile u32 ZBufferAGPRemap;	/* 0x0C30 */
-	volatile u32 TAIndexAGPRemap;	/* 0x0C34 */
-	volatile u32 TAVertexAGPRemap;	/* 0x0C38 */
-	volatile u32 TAUVAddrTrans;	/* 0x0C3C */
-	volatile u32 TATailPtrCacheTrans;	/* 0x0C40 */
-	volatile u32 TAParamWriteTrans;	/* 0x0C44 */
-	volatile u32 TAPtrWriteTrans;	/* 0x0C48 */
-	volatile u32 TAParamWriteThresh;	/* 0x0C4C */
-	volatile u32 TAPtrWriteThresh;	/* 0x0C50 */
-	volatile u32 TATailPtrCacheAGPRe;	/* 0x0C54 */
-	volatile u32 TAParamWriteAGPRe;	/* 0x0C58 */
-	volatile u32 TAPtrWriteAGPRe;	/* 0x0C5C */
-	volatile u32 SDRAMArbiterConf;	/* 0x0C60 */
-	volatile u32 SDRAMConf0;	/* 0x0C64 */
-	volatile u32 SDRAMConf1;	/* 0x0C68 */
-	volatile u32 SDRAMConf2;	/* 0x0C6C */
-	volatile u32 SDRAMRefresh;	/* 0x0C70 */
-	volatile u32 SDRAMPowerStat;	/* 0x0C74 */
-
-	volatile u32 Fill6[2];	/* GAP 0x0C78 - 0x0C7C */
-
-	volatile u32 RAMBistData;	/* 0x0C80 */
-	volatile u32 RAMBistCtrl;	/* 0x0C84 */
-	volatile u32 FIFOBistKey;	/* 0x0C88 */
-	volatile u32 RAMBistResult;	/* 0x0C8C */
-	volatile u32 FIFOBistResult;	/* 0x0C90 */
+	u32 Fill4[412];		/* 0x0190 - 0x07FC */
+
+	u32 TACtrlStreamBase;	/* 0x0800 */
+	u32 TAObjDataBase;	/* 0x0804 */
+	u32 TAPtrDataBase;	/* 0x0808 */
+	u32 TARegionDataBase;	/* 0x080C */
+	u32 TATailPtrBase;	/* 0x0810 */
+	u32 TAPtrRegionSize;	/* 0x0814 */
+	u32 TAConfiguration;	/* 0x0818 */
+	u32 TAObjDataStartAddr;	/* 0x081C */
+	u32 TAObjDataEndAddr;	/* 0x0820 */
+	u32 TAXScreenClip;	/* 0x0824 */
+	u32 TAYScreenClip;	/* 0x0828 */
+	u32 TARHWClamp;		/* 0x082C */
+	u32 TARHWCompare;	/* 0x0830 */
+	u32 TAStart;		/* 0x0834 */
+	u32 TAObjReStart;	/* 0x0838 */
+	u32 TAPtrReStart;	/* 0x083C */
+	u32 TAStatus1;		/* 0x0840 */
+	u32 TAStatus2;		/* 0x0844 */
+	u32 TAIntStatus;	/* 0x0848 */
+	u32 TAIntMask;		/* 0x084C */
+
+	u32 Fill5[235];		/* GAP 0x0850 - 0x0BF8 */
+
+	u32 TextureAddrThresh;	/* 0x0BFC */
+	u32 Core1Translation;	/* 0x0C00 */
+	u32 TextureAddrReMap;	/* 0x0C04 */
+	u32 RenderOutAGPRemap;	/* 0x0C08 */
+	u32 _3DRegionReadTrans;	/* 0x0C0C */
+	u32 _3DPtrReadTrans;	/* 0x0C10 */
+	u32 _3DParamReadTrans;	/* 0x0C14 */
+	u32 _3DRegionReadThresh;/* 0x0C18 */
+	u32 _3DPtrReadThresh;	/* 0x0C1C */
+	u32 _3DParamReadThresh;	/* 0x0C20 */
+	u32 _3DRegionReadAGPRemap;/* 0x0C24 */
+	u32 _3DPtrReadAGPRemap;	/* 0x0C28 */
+	u32 _3DParamReadAGPRemap;/* 0x0C2C */
+	u32 ZBufferAGPRemap;	/* 0x0C30 */
+	u32 TAIndexAGPRemap;	/* 0x0C34 */
+	u32 TAVertexAGPRemap;	/* 0x0C38 */
+	u32 TAUVAddrTrans;	/* 0x0C3C */
+	u32 TATailPtrCacheTrans;/* 0x0C40 */
+	u32 TAParamWriteTrans;	/* 0x0C44 */
+	u32 TAPtrWriteTrans;	/* 0x0C48 */
+	u32 TAParamWriteThresh;	/* 0x0C4C */
+	u32 TAPtrWriteThresh;	/* 0x0C50 */
+	u32 TATailPtrCacheAGPRe;/* 0x0C54 */
+	u32 TAParamWriteAGPRe;	/* 0x0C58 */
+	u32 TAPtrWriteAGPRe;	/* 0x0C5C */
+	u32 SDRAMArbiterConf;	/* 0x0C60 */
+	u32 SDRAMConf0;		/* 0x0C64 */
+	u32 SDRAMConf1;		/* 0x0C68 */
+	u32 SDRAMConf2;		/* 0x0C6C */
+	u32 SDRAMRefresh;	/* 0x0C70 */
+	u32 SDRAMPowerStat;	/* 0x0C74 */
+
+	u32 Fill6[2];		/* GAP 0x0C78 - 0x0C7C */
+
+	u32 RAMBistData;	/* 0x0C80 */
+	u32 RAMBistCtrl;	/* 0x0C84 */
+	u32 FIFOBistKey;	/* 0x0C88 */
+	u32 RAMBistResult;	/* 0x0C8C */
+	u32 FIFOBistResult;	/* 0x0C90 */
 
 	/*
-	   volatile u32 Fill11[0x0CBC/4 - 0x0C94/4]; //GAP 0x0C94 - 0x0CBC
-	   volatile u32 Fill12[0x0CD0/4 - 0x0CC0/4]; //GAP 0x0CC0 - 0x0CD0 3DRegisters
+	   u32 Fill11[0x0CBC/4 - 0x0C94/4]; //GAP 0x0C94 - 0x0CBC
+	   u32 Fill12[0x0CD0/4 - 0x0CC0/4]; //GAP 0x0CC0 - 0x0CD0 3DRegisters
 	 */
 
-	volatile u32 Fill7[16];	/* 0x0c94 - 0x0cd0 */
+	u32 Fill7[16];		/* 0x0c94 - 0x0cd0 */
 
-	volatile u32 SDRAMAddrSign;	/* 0x0CD4 */
-	volatile u32 SDRAMDataSign;	/* 0x0CD8 */
-	volatile u32 SDRAMSignConf;	/* 0x0CDC */
+	u32 SDRAMAddrSign;	/* 0x0CD4 */
+	u32 SDRAMDataSign;	/* 0x0CD8 */
+	u32 SDRAMSignConf;	/* 0x0CDC */
 
 	/* DWFILL; //GAP 0x0CE0 */
-	volatile u32 dwFill_2;
-
-	volatile u32 ISPSignature;	/* 0x0CE4 */
-
-	volatile u32 Fill8[454];	/*GAP 0x0CE8 - 0x13FC */
-
-	volatile u32 DACPrimAddress;	/* 0x1400 */
-	volatile u32 DACPrimSize;	/* 0x1404 */
-	volatile u32 DACCursorAddr;	/* 0x1408 */
-	volatile u32 DACCursorCtrl;	/* 0x140C */
-	volatile u32 DACOverlayAddr;	/* 0x1410 */
-	volatile u32 DACOverlayUAddr;	/* 0x1414 */
-	volatile u32 DACOverlayVAddr;	/* 0x1418 */
-	volatile u32 DACOverlaySize;	/* 0x141C */
-	volatile u32 DACOverlayVtDec;	/* 0x1420 */
-
-	volatile u32 Fill9[9];	/* GAP 0x1424 - 0x1444 */
-
-	volatile u32 DACVerticalScal;	/* 0x1448 */
-	volatile u32 DACPixelFormat;	/* 0x144C */
-	volatile u32 DACHorizontalScal;	/* 0x1450 */
-	volatile u32 DACVidWinStart;	/* 0x1454 */
-	volatile u32 DACVidWinEnd;	/* 0x1458 */
-	volatile u32 DACBlendCtrl;	/* 0x145C */
-	volatile u32 DACHorTim1;	/* 0x1460 */
-	volatile u32 DACHorTim2;	/* 0x1464 */
-	volatile u32 DACHorTim3;	/* 0x1468 */
-	volatile u32 DACVerTim1;	/* 0x146C */
-	volatile u32 DACVerTim2;	/* 0x1470 */
-	volatile u32 DACVerTim3;	/* 0x1474 */
-	volatile u32 DACBorderColor;	/* 0x1478 */
-	volatile u32 DACSyncCtrl;	/* 0x147C */
-	volatile u32 DACStreamCtrl;	/* 0x1480 */
-	volatile u32 DACLUTAddress;	/* 0x1484 */
-	volatile u32 DACLUTData;	/* 0x1488 */
-	volatile u32 DACBurstCtrl;	/* 0x148C */
-	volatile u32 DACCrcTrigger;	/* 0x1490 */
-	volatile u32 DACCrcDone;	/* 0x1494 */
-	volatile u32 DACCrcResult1;	/* 0x1498 */
-	volatile u32 DACCrcResult2;	/* 0x149C */
-	volatile u32 DACLinecount;	/* 0x14A0 */
-
-	volatile u32 Fill10[151];	/*GAP 0x14A4 - 0x16FC */
-
-	volatile u32 DigVidPortCtrl;	/* 0x1700 */
-	volatile u32 DigVidPortStat;	/* 0x1704 */
+	u32 dwFill_2;
+
+	u32 ISPSignature;	/* 0x0CE4 */
+
+	u32 Fill8[454];		/*GAP 0x0CE8 - 0x13FC */
+
+	u32 DACPrimAddress;	/* 0x1400 */
+	u32 DACPrimSize;	/* 0x1404 */
+	u32 DACCursorAddr;	/* 0x1408 */
+	u32 DACCursorCtrl;	/* 0x140C */
+	u32 DACOverlayAddr;	/* 0x1410 */
+	u32 DACOverlayUAddr;	/* 0x1414 */
+	u32 DACOverlayVAddr;	/* 0x1418 */
+	u32 DACOverlaySize;	/* 0x141C */
+	u32 DACOverlayVtDec;	/* 0x1420 */
+
+	u32 Fill9[9];		/* GAP 0x1424 - 0x1444 */
+
+	u32 DACVerticalScal;	/* 0x1448 */
+	u32 DACPixelFormat;	/* 0x144C */
+	u32 DACHorizontalScal;	/* 0x1450 */
+	u32 DACVidWinStart;	/* 0x1454 */
+	u32 DACVidWinEnd;	/* 0x1458 */
+	u32 DACBlendCtrl;	/* 0x145C */
+	u32 DACHorTim1;		/* 0x1460 */
+	u32 DACHorTim2;		/* 0x1464 */
+	u32 DACHorTim3;		/* 0x1468 */
+	u32 DACVerTim1;		/* 0x146C */
+	u32 DACVerTim2;		/* 0x1470 */
+	u32 DACVerTim3;		/* 0x1474 */
+	u32 DACBorderColor;	/* 0x1478 */
+	u32 DACSyncCtrl;	/* 0x147C */
+	u32 DACStreamCtrl;	/* 0x1480 */
+	u32 DACLUTAddress;	/* 0x1484 */
+	u32 DACLUTData;		/* 0x1488 */
+	u32 DACBurstCtrl;	/* 0x148C */
+	u32 DACCrcTrigger;	/* 0x1490 */
+	u32 DACCrcDone;		/* 0x1494 */
+	u32 DACCrcResult1;	/* 0x1498 */
+	u32 DACCrcResult2;	/* 0x149C */
+	u32 DACLinecount;	/* 0x14A0 */
+
+	u32 Fill10[151];	/*GAP 0x14A4 - 0x16FC */
+
+	u32 DigVidPortCtrl;	/* 0x1700 */
+	u32 DigVidPortStat;	/* 0x1704 */
 
 	/*
-	   volatile u32 Fill11[0x1FFC/4 - 0x1708/4]; //GAP 0x1708 - 0x1FFC
-	   volatile u32 Fill17[0x3000/4 - 0x2FFC/4]; //GAP 0x2000 - 0x2FFC ALUT
+	   u32 Fill11[0x1FFC/4 - 0x1708/4]; //GAP 0x1708 - 0x1FFC
+	   u32 Fill17[0x3000/4 - 0x2FFC/4]; //GAP 0x2000 - 0x2FFC ALUT
 	 */
 
-	volatile u32 Fill11[1598];
+	u32 Fill11[1598];
 
 	/* DWFILL; //GAP 0x3000          ALUT 256MB offset */
-	volatile u32 Fill_3;
+	u32 Fill_3;
 
 } STG4000REG;
 
diff --git a/drivers/video/fbdev/kyro/STG4000VTG.c b/drivers/video/fbdev/kyro/STG4000VTG.c
index bd389709d234..6780a441c765 100644
--- a/drivers/video/fbdev/kyro/STG4000VTG.c
+++ b/drivers/video/fbdev/kyro/STG4000VTG.c
@@ -14,7 +14,7 @@
 #include "STG4000Reg.h"
 #include "STG4000Interface.h"
 
-void DisableVGA(volatile STG4000REG __iomem *pSTGReg)
+void DisableVGA(STG4000REG __iomem *pSTGReg)
 {
 	u32 tmp;
 	volatile u32 count = 0, i;
@@ -35,7 +35,7 @@ void DisableVGA(volatile STG4000REG __iomem *pSTGReg)
 	STG_WRITE_REG(SoftwareReset, tmp);
 }
 
-void StopVTG(volatile STG4000REG __iomem *pSTGReg)
+void StopVTG(STG4000REG __iomem *pSTGReg)
 {
 	u32 tmp = 0;
 
@@ -45,7 +45,7 @@ void StopVTG(volatile STG4000REG __iomem *pSTGReg)
 	STG_WRITE_REG(DACSyncCtrl, tmp);
 }
 
-void StartVTG(volatile STG4000REG __iomem *pSTGReg)
+void StartVTG(STG4000REG __iomem *pSTGReg)
 {
 	u32 tmp = 0;
 
@@ -56,7 +56,7 @@ void StartVTG(volatile STG4000REG __iomem *pSTGReg)
 	STG_WRITE_REG(DACSyncCtrl, tmp);
 }
 
-void SetupVTG(volatile STG4000REG __iomem *pSTGReg,
+void SetupVTG(STG4000REG __iomem *pSTGReg,
 	      const struct kyrofb_info * pTiming)
 {
 	u32 tmp = 0;
diff --git a/drivers/video/fbdev/nvidia/nv_type.h b/drivers/video/fbdev/nvidia/nv_type.h
index d7a1d4363d5f..15a857dcde5a 100644
--- a/drivers/video/fbdev/nvidia/nv_type.h
+++ b/drivers/video/fbdev/nvidia/nv_type.h
@@ -152,25 +152,25 @@ struct nvidia_par {
 	int wc_cookie;
 	struct nvidia_i2c_chan chan[3];
 
-	volatile u32 __iomem *REGS;
-	volatile u32 __iomem *PCRTC0;
-	volatile u32 __iomem *PCRTC;
-	volatile u32 __iomem *PRAMDAC0;
-	volatile u32 __iomem *PFB;
-	volatile u32 __iomem *PFIFO;
-	volatile u32 __iomem *PGRAPH;
-	volatile u32 __iomem *PEXTDEV;
-	volatile u32 __iomem *PTIMER;
-	volatile u32 __iomem *PMC;
-	volatile u32 __iomem *PRAMIN;
-	volatile u32 __iomem *FIFO;
-	volatile u32 __iomem *CURSOR;
-	volatile u8 __iomem *PCIO0;
-	volatile u8 __iomem *PCIO;
-	volatile u8 __iomem *PVIO;
-	volatile u8 __iomem *PDIO0;
-	volatile u8 __iomem *PDIO;
-	volatile u32 __iomem *PRAMDAC;
+	u32 __iomem *REGS;
+	u32 __iomem *PCRTC0;
+	u32 __iomem *PCRTC;
+	u32 __iomem *PRAMDAC0;
+	u32 __iomem *PFB;
+	u32 __iomem *PFIFO;
+	u32 __iomem *PGRAPH;
+	u32 __iomem *PEXTDEV;
+	u32 __iomem *PTIMER;
+	u32 __iomem *PMC;
+	u32 __iomem *PRAMIN;
+	u32 __iomem *FIFO;
+	u32 __iomem *CURSOR;
+	u8 __iomem *PCIO0;
+	u8 __iomem *PCIO;
+	u8 __iomem *PVIO;
+	u8 __iomem *PDIO0;
+	u8 __iomem *PDIO;
+	u32 __iomem *PRAMDAC;
 };
 
 #endif				/* __NV_TYPE_H__ */
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 8900f181f195..53d72abbd0a3 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -395,8 +395,8 @@ static int nvidia_calc_regs(struct fb_info *info)
 		i = 32;
 
 	if (par->Architecture >= NV_ARCH_10)
-		par->CURSOR = (volatile u32 __iomem *)(info->screen_base +
-						       par->CursorStart);
+		par->CURSOR = (u32 __iomem *)(info->screen_base +
+					      par->CursorStart);
 
 	if (info->var.sync & FB_SYNC_HOR_HIGH_ACT)
 		state->misc_output &= ~0x40;
@@ -1201,8 +1201,7 @@ static int nvidia_set_fbinfo(struct fb_info *info)
 	return nvidiafb_check_var(&info->var, info);
 }
 
-static u32 nvidia_get_chipset(struct pci_dev *pci_dev,
-			      volatile u32 __iomem *REGS)
+static u32 nvidia_get_chipset(struct pci_dev *pci_dev, u32 __iomem *REGS)
 {
 	u32 id = (pci_dev->vendor << 16) | pci_dev->device;
 
@@ -1281,7 +1280,7 @@ static int nvidiafb_probe(struct pci_dev *pd, const struct pci_device_id *ent)
 	struct fb_info *info;
 	unsigned short cmd;
 	int ret;
-	volatile u32 __iomem *REGS;
+	u32 __iomem *REGS;
 	int Chipset;
 	u32 Architecture;
 
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 1e377b2ec089..f8998fc3ac5f 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -1487,7 +1487,7 @@ static void rivafb_imageblit(struct fb_info *info,
 	struct riva_par *par = info->par;
 	u32 fgx = 0, bgx = 0, width, tmp;
 	u8 *cdat = (u8 *) image->data;
-	volatile u32 __iomem *d;
+	u32 __iomem *d;
 	int i, size;
 
 	if ((info->flags & FBINFO_HWACCEL_DISABLED) || image->depth != 1) {
diff --git a/drivers/video/fbdev/riva/nv_driver.c b/drivers/video/fbdev/riva/nv_driver.c
index a3d9c66973ad..48e15aef6c13 100644
--- a/drivers/video/fbdev/riva/nv_driver.c
+++ b/drivers/video/fbdev/riva/nv_driver.c
@@ -51,7 +51,7 @@ static inline unsigned char MISCin(struct riva_par *par)
 static Bool 
 riva_is_connected(struct riva_par *par, Bool second)
 {
-	volatile U032 __iomem *PRAMDAC = par->riva.PRAMDAC0;
+	U032 __iomem *PRAMDAC = par->riva.PRAMDAC0;
 	U032 reg52C, reg608;
 	Bool present;
 
@@ -315,22 +315,14 @@ void
 riva_common_setup(struct riva_par *par)
 {
 	par->riva.EnableIRQ = 0;
-	par->riva.PRAMDAC0 =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00680000);
-	par->riva.PFB =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00100000);
-	par->riva.PFIFO =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00002000);
-	par->riva.PGRAPH =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00400000);
-	par->riva.PEXTDEV =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00101000);
-	par->riva.PTIMER =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00009000);
-	par->riva.PMC =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00000000);
-	par->riva.FIFO =
-		(volatile U032 __iomem *)(par->ctrl_base + 0x00800000);
+	par->riva.PRAMDAC0 = (U032 __iomem *)(par->ctrl_base + 0x00680000);
+	par->riva.PFB = (U032 __iomem *)(par->ctrl_base + 0x00100000);
+	par->riva.PFIFO = (U032 __iomem *)(par->ctrl_base + 0x00002000);
+	par->riva.PGRAPH = (U032 __iomem *)(par->ctrl_base + 0x00400000);
+	par->riva.PEXTDEV = (U032 __iomem *)(par->ctrl_base + 0x00101000);
+	par->riva.PTIMER = (U032 __iomem *)(par->ctrl_base + 0x00009000);
+	par->riva.PMC = (U032 __iomem *)(par->ctrl_base + 0x00000000);
+	par->riva.FIFO = (U032 __iomem *)(par->ctrl_base + 0x00800000);
 	par->riva.PCIO0 = par->ctrl_base + 0x00601000;
 	par->riva.PDIO0 = par->ctrl_base + 0x00681000;
 	par->riva.PVIO = par->ctrl_base + 0x000C0000;
diff --git a/drivers/video/fbdev/riva/riva_hw.h b/drivers/video/fbdev/riva/riva_hw.h
index 5e7b35466b00..d9f3f4c7888c 100644
--- a/drivers/video/fbdev/riva/riva_hw.h
+++ b/drivers/video/fbdev/riva/riva_hw.h
@@ -104,7 +104,7 @@ typedef unsigned int   U032;
 /*
  * Raster OPeration. Windows style ROP3.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -119,7 +119,7 @@ typedef volatile struct
 /*
  * 8X8 Monochrome pattern.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -138,7 +138,7 @@ typedef volatile struct
 /*
  * Scissor clip rectangle.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -154,7 +154,7 @@ typedef volatile struct
 /*
  * 2D filled rectangle.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -172,7 +172,7 @@ typedef volatile struct
 /*
  * 2D screen-screen BLT.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -189,7 +189,7 @@ typedef volatile struct
 /*
  * 2D pixel BLT.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -208,7 +208,7 @@ typedef volatile struct
 /*
  * Filled rectangle combined with monochrome expand.  Useful for glyphs.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -274,7 +274,7 @@ typedef volatile struct
 /*
  * 3D textured, Z buffered triangle.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -304,7 +304,7 @@ typedef volatile struct
     float TextureS;
     float TextureT;
 } RivaTexturedTriangle03;
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -342,7 +342,7 @@ typedef volatile struct
 /*
  * 2D line.
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -377,7 +377,7 @@ typedef volatile struct
 /*
  * 2D/3D surfaces
  */
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -389,7 +389,7 @@ typedef volatile struct
     U032 reserved01[0x0BE];
     U032 Offset;
 } RivaSurface;
-typedef volatile struct
+typedef struct
 {
     U032 reserved00[4];
 #ifdef __BIG_ENDIAN
@@ -441,24 +441,24 @@ typedef struct _riva_hw_inst
     /*
      * Non-FIFO registers.
      */
-    volatile U032 __iomem *PCRTC0;
-    volatile U032 __iomem *PCRTC;
-    volatile U032 __iomem *PRAMDAC0;
-    volatile U032 __iomem *PFB;
-    volatile U032 __iomem *PFIFO;
-    volatile U032 __iomem *PGRAPH;
-    volatile U032 __iomem *PEXTDEV;
-    volatile U032 __iomem *PTIMER;
-    volatile U032 __iomem *PMC;
-    volatile U032 __iomem *PRAMIN;
-    volatile U032 __iomem *FIFO;
-    volatile U032 __iomem *CURSOR;
-    volatile U008 __iomem *PCIO0;
-    volatile U008 __iomem *PCIO;
-    volatile U008 __iomem *PVIO;
-    volatile U008 __iomem *PDIO0;
-    volatile U008 __iomem *PDIO;
-    volatile U032 __iomem *PRAMDAC;
+    U032 __iomem *PCRTC0;
+    U032 __iomem *PCRTC;
+    U032 __iomem *PRAMDAC0;
+    U032 __iomem *PFB;
+    U032 __iomem *PFIFO;
+    U032 __iomem *PGRAPH;
+    U032 __iomem *PEXTDEV;
+    U032 __iomem *PTIMER;
+    U032 __iomem *PMC;
+    U032 __iomem *PRAMIN;
+    U032 __iomem *FIFO;
+    U032 __iomem *CURSOR;
+    U008 __iomem *PCIO0;
+    U008 __iomem *PCIO;
+    U008 __iomem *PVIO;
+    U008 __iomem *PDIO0;
+    U008 __iomem *PDIO;
+    U032 __iomem *PRAMDAC;
     /*
      * Common chip functions.
      */
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index e22e5ece063f..75ad78a68d43 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -80,24 +80,24 @@ DECLARE_TRACEPOINT(rwmmio_post_write);
 DECLARE_TRACEPOINT(rwmmio_read);
 DECLARE_TRACEPOINT(rwmmio_post_read);
 
-void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
+void log_write_mmio(u64 val, u8 width, void __iomem *addr,
 		    unsigned long caller_addr, unsigned long caller_addr0);
-void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
+void log_post_write_mmio(u64 val, u8 width, void __iomem *addr,
 			 unsigned long caller_addr, unsigned long caller_addr0);
-void log_read_mmio(u8 width, const volatile void __iomem *addr,
+void log_read_mmio(u8 width, const void __iomem *addr,
 		   unsigned long caller_addr, unsigned long caller_addr0);
-void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
+void log_post_read_mmio(u64 val, u8 width, const void __iomem *addr,
 			unsigned long caller_addr, unsigned long caller_addr0);
 
 #else
 
-static inline void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
+static inline void log_write_mmio(u64 val, u8 width, void __iomem *addr,
 				  unsigned long caller_addr, unsigned long caller_addr0) {}
-static inline void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
+static inline void log_post_write_mmio(u64 val, u8 width, void __iomem *addr,
 				       unsigned long caller_addr, unsigned long caller_addr0) {}
-static inline void log_read_mmio(u8 width, const volatile void __iomem *addr,
+static inline void log_read_mmio(u8 width, const void __iomem *addr,
 				 unsigned long caller_addr, unsigned long caller_addr0) {}
-static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
+static inline void log_post_read_mmio(u64 val, u8 width, const void __iomem *addr,
 				      unsigned long caller_addr, unsigned long caller_addr0) {}
 
 #endif /* CONFIG_TRACE_MMIO_ACCESS */
@@ -112,7 +112,7 @@ static inline void log_post_read_mmio(u64 val, u8 width, const volatile void __i
 
 #ifndef __raw_readb
 #define __raw_readb __raw_readb
-static inline u8 __raw_readb(const volatile void __iomem *addr)
+static inline u8 __raw_readb(const void __iomem *addr)
 {
 	return *(const volatile u8 __force *)addr;
 }
@@ -120,7 +120,7 @@ static inline u8 __raw_readb(const volatile void __iomem *addr)
 
 #ifndef __raw_readw
 #define __raw_readw __raw_readw
-static inline u16 __raw_readw(const volatile void __iomem *addr)
+static inline u16 __raw_readw(const void __iomem *addr)
 {
 	return *(const volatile u16 __force *)addr;
 }
@@ -128,7 +128,7 @@ static inline u16 __raw_readw(const volatile void __iomem *addr)
 
 #ifndef __raw_readl
 #define __raw_readl __raw_readl
-static inline u32 __raw_readl(const volatile void __iomem *addr)
+static inline u32 __raw_readl(const void __iomem *addr)
 {
 	return *(const volatile u32 __force *)addr;
 }
@@ -137,7 +137,7 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef __raw_readq
 #define __raw_readq __raw_readq
-static inline u64 __raw_readq(const volatile void __iomem *addr)
+static inline u64 __raw_readq(const void __iomem *addr)
 {
 	return *(const volatile u64 __force *)addr;
 }
@@ -146,7 +146,7 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 
 #ifndef __raw_writeb
 #define __raw_writeb __raw_writeb
-static inline void __raw_writeb(u8 value, volatile void __iomem *addr)
+static inline void __raw_writeb(u8 value, void __iomem *addr)
 {
 	*(volatile u8 __force *)addr = value;
 }
@@ -154,7 +154,7 @@ static inline void __raw_writeb(u8 value, volatile void __iomem *addr)
 
 #ifndef __raw_writew
 #define __raw_writew __raw_writew
-static inline void __raw_writew(u16 value, volatile void __iomem *addr)
+static inline void __raw_writew(u16 value, void __iomem *addr)
 {
 	*(volatile u16 __force *)addr = value;
 }
@@ -162,7 +162,7 @@ static inline void __raw_writew(u16 value, volatile void __iomem *addr)
 
 #ifndef __raw_writel
 #define __raw_writel __raw_writel
-static inline void __raw_writel(u32 value, volatile void __iomem *addr)
+static inline void __raw_writel(u32 value, void __iomem *addr)
 {
 	*(volatile u32 __force *)addr = value;
 }
@@ -171,7 +171,7 @@ static inline void __raw_writel(u32 value, volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef __raw_writeq
 #define __raw_writeq __raw_writeq
-static inline void __raw_writeq(u64 value, volatile void __iomem *addr)
+static inline void __raw_writeq(u64 value, void __iomem *addr)
 {
 	*(volatile u64 __force *)addr = value;
 }
@@ -185,7 +185,7 @@ static inline void __raw_writeq(u64 value, volatile void __iomem *addr)
 
 #ifndef readb
 #define readb readb
-static inline u8 readb(const volatile void __iomem *addr)
+static inline u8 readb(const void __iomem *addr)
 {
 	u8 val;
 
@@ -200,7 +200,7 @@ static inline u8 readb(const volatile void __iomem *addr)
 
 #ifndef readw
 #define readw readw
-static inline u16 readw(const volatile void __iomem *addr)
+static inline u16 readw(const void __iomem *addr)
 {
 	u16 val;
 
@@ -215,7 +215,7 @@ static inline u16 readw(const volatile void __iomem *addr)
 
 #ifndef readl
 #define readl readl
-static inline u32 readl(const volatile void __iomem *addr)
+static inline u32 readl(const void __iomem *addr)
 {
 	u32 val;
 
@@ -231,7 +231,7 @@ static inline u32 readl(const volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef readq
 #define readq readq
-static inline u64 readq(const volatile void __iomem *addr)
+static inline u64 readq(const void __iomem *addr)
 {
 	u64 val;
 
@@ -247,7 +247,7 @@ static inline u64 readq(const volatile void __iomem *addr)
 
 #ifndef writeb
 #define writeb writeb
-static inline void writeb(u8 value, volatile void __iomem *addr)
+static inline void writeb(u8 value, void __iomem *addr)
 {
 	log_write_mmio(value, 8, addr, _THIS_IP_, _RET_IP_);
 	__io_bw();
@@ -259,7 +259,7 @@ static inline void writeb(u8 value, volatile void __iomem *addr)
 
 #ifndef writew
 #define writew writew
-static inline void writew(u16 value, volatile void __iomem *addr)
+static inline void writew(u16 value, void __iomem *addr)
 {
 	log_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
 	__io_bw();
@@ -271,7 +271,7 @@ static inline void writew(u16 value, volatile void __iomem *addr)
 
 #ifndef writel
 #define writel writel
-static inline void writel(u32 value, volatile void __iomem *addr)
+static inline void writel(u32 value, void __iomem *addr)
 {
 	log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
 	__io_bw();
@@ -284,7 +284,7 @@ static inline void writel(u32 value, volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef writeq
 #define writeq writeq
-static inline void writeq(u64 value, volatile void __iomem *addr)
+static inline void writeq(u64 value, void __iomem *addr)
 {
 	log_write_mmio(value, 64, addr, _THIS_IP_, _RET_IP_);
 	__io_bw();
@@ -302,7 +302,7 @@ static inline void writeq(u64 value, volatile void __iomem *addr)
  */
 #ifndef readb_relaxed
 #define readb_relaxed readb_relaxed
-static inline u8 readb_relaxed(const volatile void __iomem *addr)
+static inline u8 readb_relaxed(const void __iomem *addr)
 {
 	u8 val;
 
@@ -315,7 +315,7 @@ static inline u8 readb_relaxed(const volatile void __iomem *addr)
 
 #ifndef readw_relaxed
 #define readw_relaxed readw_relaxed
-static inline u16 readw_relaxed(const volatile void __iomem *addr)
+static inline u16 readw_relaxed(const void __iomem *addr)
 {
 	u16 val;
 
@@ -328,7 +328,7 @@ static inline u16 readw_relaxed(const volatile void __iomem *addr)
 
 #ifndef readl_relaxed
 #define readl_relaxed readl_relaxed
-static inline u32 readl_relaxed(const volatile void __iomem *addr)
+static inline u32 readl_relaxed(const void __iomem *addr)
 {
 	u32 val;
 
@@ -341,7 +341,7 @@ static inline u32 readl_relaxed(const volatile void __iomem *addr)
 
 #if defined(readq) && !defined(readq_relaxed)
 #define readq_relaxed readq_relaxed
-static inline u64 readq_relaxed(const volatile void __iomem *addr)
+static inline u64 readq_relaxed(const void __iomem *addr)
 {
 	u64 val;
 
@@ -354,7 +354,7 @@ static inline u64 readq_relaxed(const volatile void __iomem *addr)
 
 #ifndef writeb_relaxed
 #define writeb_relaxed writeb_relaxed
-static inline void writeb_relaxed(u8 value, volatile void __iomem *addr)
+static inline void writeb_relaxed(u8 value, void __iomem *addr)
 {
 	log_write_mmio(value, 8, addr, _THIS_IP_, _RET_IP_);
 	__raw_writeb(value, addr);
@@ -364,7 +364,7 @@ static inline void writeb_relaxed(u8 value, volatile void __iomem *addr)
 
 #ifndef writew_relaxed
 #define writew_relaxed writew_relaxed
-static inline void writew_relaxed(u16 value, volatile void __iomem *addr)
+static inline void writew_relaxed(u16 value, void __iomem *addr)
 {
 	log_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
 	__raw_writew((u16 __force)cpu_to_le16(value), addr);
@@ -374,7 +374,7 @@ static inline void writew_relaxed(u16 value, volatile void __iomem *addr)
 
 #ifndef writel_relaxed
 #define writel_relaxed writel_relaxed
-static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
+static inline void writel_relaxed(u32 value, void __iomem *addr)
 {
 	log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
 	__raw_writel((u32 __force)__cpu_to_le32(value), addr);
@@ -384,7 +384,7 @@ static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
 
 #if defined(writeq) && !defined(writeq_relaxed)
 #define writeq_relaxed writeq_relaxed
-static inline void writeq_relaxed(u64 value, volatile void __iomem *addr)
+static inline void writeq_relaxed(u64 value, void __iomem *addr)
 {
 	log_write_mmio(value, 64, addr, _THIS_IP_, _RET_IP_);
 	__raw_writeq((u64 __force)__cpu_to_le64(value), addr);
@@ -398,7 +398,7 @@ static inline void writeq_relaxed(u64 value, volatile void __iomem *addr)
  */
 #ifndef readsb
 #define readsb readsb
-static inline void readsb(const volatile void __iomem *addr, void *buffer,
+static inline void readsb(const void __iomem *addr, void *buffer,
 			  unsigned int count)
 {
 	if (count) {
@@ -414,7 +414,7 @@ static inline void readsb(const volatile void __iomem *addr, void *buffer,
 
 #ifndef readsw
 #define readsw readsw
-static inline void readsw(const volatile void __iomem *addr, void *buffer,
+static inline void readsw(const void __iomem *addr, void *buffer,
 			  unsigned int count)
 {
 	if (count) {
@@ -430,7 +430,7 @@ static inline void readsw(const volatile void __iomem *addr, void *buffer,
 
 #ifndef readsl
 #define readsl readsl
-static inline void readsl(const volatile void __iomem *addr, void *buffer,
+static inline void readsl(const void __iomem *addr, void *buffer,
 			  unsigned int count)
 {
 	if (count) {
@@ -447,7 +447,7 @@ static inline void readsl(const volatile void __iomem *addr, void *buffer,
 #ifdef CONFIG_64BIT
 #ifndef readsq
 #define readsq readsq
-static inline void readsq(const volatile void __iomem *addr, void *buffer,
+static inline void readsq(const void __iomem *addr, void *buffer,
 			  unsigned int count)
 {
 	if (count) {
@@ -464,7 +464,7 @@ static inline void readsq(const volatile void __iomem *addr, void *buffer,
 
 #ifndef writesb
 #define writesb writesb
-static inline void writesb(volatile void __iomem *addr, const void *buffer,
+static inline void writesb(void __iomem *addr, const void *buffer,
 			   unsigned int count)
 {
 	if (count) {
@@ -479,7 +479,7 @@ static inline void writesb(volatile void __iomem *addr, const void *buffer,
 
 #ifndef writesw
 #define writesw writesw
-static inline void writesw(volatile void __iomem *addr, const void *buffer,
+static inline void writesw(void __iomem *addr, const void *buffer,
 			   unsigned int count)
 {
 	if (count) {
@@ -494,7 +494,7 @@ static inline void writesw(volatile void __iomem *addr, const void *buffer,
 
 #ifndef writesl
 #define writesl writesl
-static inline void writesl(volatile void __iomem *addr, const void *buffer,
+static inline void writesl(void __iomem *addr, const void *buffer,
 			   unsigned int count)
 {
 	if (count) {
@@ -510,7 +510,7 @@ static inline void writesl(volatile void __iomem *addr, const void *buffer,
 #ifdef CONFIG_64BIT
 #ifndef writesq
 #define writesq writesq
-static inline void writesq(volatile void __iomem *addr, const void *buffer,
+static inline void writesq(void __iomem *addr, const void *buffer,
 			   unsigned int count)
 {
 	if (count) {
@@ -851,7 +851,7 @@ static inline void outsl_p(unsigned long addr, const void *buffer,
 #ifndef CONFIG_GENERIC_IOMAP
 #ifndef ioread8
 #define ioread8 ioread8
-static inline u8 ioread8(const volatile void __iomem *addr)
+static inline u8 ioread8(const void __iomem *addr)
 {
 	return readb(addr);
 }
@@ -859,7 +859,7 @@ static inline u8 ioread8(const volatile void __iomem *addr)
 
 #ifndef ioread16
 #define ioread16 ioread16
-static inline u16 ioread16(const volatile void __iomem *addr)
+static inline u16 ioread16(const void __iomem *addr)
 {
 	return readw(addr);
 }
@@ -867,7 +867,7 @@ static inline u16 ioread16(const volatile void __iomem *addr)
 
 #ifndef ioread32
 #define ioread32 ioread32
-static inline u32 ioread32(const volatile void __iomem *addr)
+static inline u32 ioread32(const void __iomem *addr)
 {
 	return readl(addr);
 }
@@ -876,7 +876,7 @@ static inline u32 ioread32(const volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef ioread64
 #define ioread64 ioread64
-static inline u64 ioread64(const volatile void __iomem *addr)
+static inline u64 ioread64(const void __iomem *addr)
 {
 	return readq(addr);
 }
@@ -885,7 +885,7 @@ static inline u64 ioread64(const volatile void __iomem *addr)
 
 #ifndef iowrite8
 #define iowrite8 iowrite8
-static inline void iowrite8(u8 value, volatile void __iomem *addr)
+static inline void iowrite8(u8 value, void __iomem *addr)
 {
 	writeb(value, addr);
 }
@@ -893,7 +893,7 @@ static inline void iowrite8(u8 value, volatile void __iomem *addr)
 
 #ifndef iowrite16
 #define iowrite16 iowrite16
-static inline void iowrite16(u16 value, volatile void __iomem *addr)
+static inline void iowrite16(u16 value, void __iomem *addr)
 {
 	writew(value, addr);
 }
@@ -901,7 +901,7 @@ static inline void iowrite16(u16 value, volatile void __iomem *addr)
 
 #ifndef iowrite32
 #define iowrite32 iowrite32
-static inline void iowrite32(u32 value, volatile void __iomem *addr)
+static inline void iowrite32(u32 value, void __iomem *addr)
 {
 	writel(value, addr);
 }
@@ -910,7 +910,7 @@ static inline void iowrite32(u32 value, volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef iowrite64
 #define iowrite64 iowrite64
-static inline void iowrite64(u64 value, volatile void __iomem *addr)
+static inline void iowrite64(u64 value, void __iomem *addr)
 {
 	writeq(value, addr);
 }
@@ -919,7 +919,7 @@ static inline void iowrite64(u64 value, volatile void __iomem *addr)
 
 #ifndef ioread16be
 #define ioread16be ioread16be
-static inline u16 ioread16be(const volatile void __iomem *addr)
+static inline u16 ioread16be(const void __iomem *addr)
 {
 	return swab16(readw(addr));
 }
@@ -927,7 +927,7 @@ static inline u16 ioread16be(const volatile void __iomem *addr)
 
 #ifndef ioread32be
 #define ioread32be ioread32be
-static inline u32 ioread32be(const volatile void __iomem *addr)
+static inline u32 ioread32be(const void __iomem *addr)
 {
 	return swab32(readl(addr));
 }
@@ -936,7 +936,7 @@ static inline u32 ioread32be(const volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef ioread64be
 #define ioread64be ioread64be
-static inline u64 ioread64be(const volatile void __iomem *addr)
+static inline u64 ioread64be(const void __iomem *addr)
 {
 	return swab64(readq(addr));
 }
@@ -945,7 +945,7 @@ static inline u64 ioread64be(const volatile void __iomem *addr)
 
 #ifndef iowrite16be
 #define iowrite16be iowrite16be
-static inline void iowrite16be(u16 value, void volatile __iomem *addr)
+static inline void iowrite16be(u16 value, void __iomem *addr)
 {
 	writew(swab16(value), addr);
 }
@@ -953,7 +953,7 @@ static inline void iowrite16be(u16 value, void volatile __iomem *addr)
 
 #ifndef iowrite32be
 #define iowrite32be iowrite32be
-static inline void iowrite32be(u32 value, volatile void __iomem *addr)
+static inline void iowrite32be(u32 value, void __iomem *addr)
 {
 	writel(swab32(value), addr);
 }
@@ -962,7 +962,7 @@ static inline void iowrite32be(u32 value, volatile void __iomem *addr)
 #ifdef CONFIG_64BIT
 #ifndef iowrite64be
 #define iowrite64be iowrite64be
-static inline void iowrite64be(u64 value, volatile void __iomem *addr)
+static inline void iowrite64be(u64 value, void __iomem *addr)
 {
 	writeq(swab64(value), addr);
 }
@@ -971,7 +971,7 @@ static inline void iowrite64be(u64 value, volatile void __iomem *addr)
 
 #ifndef ioread8_rep
 #define ioread8_rep ioread8_rep
-static inline void ioread8_rep(const volatile void __iomem *addr, void *buffer,
+static inline void ioread8_rep(const void __iomem *addr, void *buffer,
 			       unsigned int count)
 {
 	readsb(addr, buffer, count);
@@ -980,7 +980,7 @@ static inline void ioread8_rep(const volatile void __iomem *addr, void *buffer,
 
 #ifndef ioread16_rep
 #define ioread16_rep ioread16_rep
-static inline void ioread16_rep(const volatile void __iomem *addr,
+static inline void ioread16_rep(const void __iomem *addr,
 				void *buffer, unsigned int count)
 {
 	readsw(addr, buffer, count);
@@ -989,7 +989,7 @@ static inline void ioread16_rep(const volatile void __iomem *addr,
 
 #ifndef ioread32_rep
 #define ioread32_rep ioread32_rep
-static inline void ioread32_rep(const volatile void __iomem *addr,
+static inline void ioread32_rep(const void __iomem *addr,
 				void *buffer, unsigned int count)
 {
 	readsl(addr, buffer, count);
@@ -999,7 +999,7 @@ static inline void ioread32_rep(const volatile void __iomem *addr,
 #ifdef CONFIG_64BIT
 #ifndef ioread64_rep
 #define ioread64_rep ioread64_rep
-static inline void ioread64_rep(const volatile void __iomem *addr,
+static inline void ioread64_rep(const void __iomem *addr,
 				void *buffer, unsigned int count)
 {
 	readsq(addr, buffer, count);
@@ -1009,7 +1009,7 @@ static inline void ioread64_rep(const volatile void __iomem *addr,
 
 #ifndef iowrite8_rep
 #define iowrite8_rep iowrite8_rep
-static inline void iowrite8_rep(volatile void __iomem *addr,
+static inline void iowrite8_rep(void __iomem *addr,
 				const void *buffer,
 				unsigned int count)
 {
@@ -1019,7 +1019,7 @@ static inline void iowrite8_rep(volatile void __iomem *addr,
 
 #ifndef iowrite16_rep
 #define iowrite16_rep iowrite16_rep
-static inline void iowrite16_rep(volatile void __iomem *addr,
+static inline void iowrite16_rep(void __iomem *addr,
 				 const void *buffer,
 				 unsigned int count)
 {
@@ -1029,7 +1029,7 @@ static inline void iowrite16_rep(volatile void __iomem *addr,
 
 #ifndef iowrite32_rep
 #define iowrite32_rep iowrite32_rep
-static inline void iowrite32_rep(volatile void __iomem *addr,
+static inline void iowrite32_rep(void __iomem *addr,
 				 const void *buffer,
 				 unsigned int count)
 {
@@ -1040,7 +1040,7 @@ static inline void iowrite32_rep(volatile void __iomem *addr,
 #ifdef CONFIG_64BIT
 #ifndef iowrite64_rep
 #define iowrite64_rep iowrite64_rep
-static inline void iowrite64_rep(volatile void __iomem *addr,
+static inline void iowrite64_rep(void __iomem *addr,
 				 const void *buffer,
 				 unsigned int count)
 {
@@ -1078,7 +1078,7 @@ static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
 
 #ifndef iounmap
 #define iounmap iounmap
-static inline void iounmap(volatile void __iomem *addr)
+static inline void iounmap(void __iomem *addr)
 {
 }
 #endif
@@ -1088,8 +1088,8 @@ void __iomem *generic_ioremap_prot(phys_addr_t phys_addr, size_t size,
 
 void __iomem *ioremap_prot(phys_addr_t phys_addr, size_t size,
 			   pgprot_t prot);
-void iounmap(volatile void __iomem *addr);
-void generic_iounmap(volatile void __iomem *addr);
+void iounmap(void __iomem *addr);
+void generic_iounmap(void __iomem *addr);
 #ifndef ioremap
 void __iomem *ioremap(phys_addr_t addr, size_t size);
 #endif
@@ -1174,7 +1174,7 @@ extern void ioport_unmap(void __iomem *p);
  *
  * Set a range of I/O memory to a given value.
  */
-void memset_io(volatile void __iomem *addr, int val, size_t count);
+void memset_io(void __iomem *addr, int val, size_t count);
 #endif
 
 #ifndef memcpy_fromio
@@ -1186,7 +1186,7 @@ void memset_io(volatile void __iomem *addr, int val, size_t count);
  *
  * Copy a block of data from I/O memory.
  */
-void memcpy_fromio(void *dst, const volatile void __iomem *src, size_t count);
+void memcpy_fromio(void *dst, const void __iomem *src, size_t count);
 #endif
 
 #ifndef memcpy_toio
@@ -1198,7 +1198,7 @@ void memcpy_fromio(void *dst, const volatile void __iomem *src, size_t count);
  *
  * Copy a block of data to I/O memory.
  */
-void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count);
+void memcpy_toio(void __iomem *dst, const void *src, size_t count);
 #endif
 
 extern int devmem_is_allowed(unsigned long pfn);
diff --git a/include/asm-generic/video.h b/include/asm-generic/video.h
index b1da2309d943..22c1a945f2a7 100644
--- a/include/asm-generic/video.h
+++ b/include/asm-generic/video.h
@@ -42,7 +42,7 @@ static inline bool video_is_primary_device(struct device *dev)
  */
 
 #ifndef fb_readb
-static inline u8 fb_readb(const volatile void __iomem *addr)
+static inline u8 fb_readb(const void __iomem *addr)
 {
 	return __raw_readb(addr);
 }
@@ -50,7 +50,7 @@ static inline u8 fb_readb(const volatile void __iomem *addr)
 #endif
 
 #ifndef fb_readw
-static inline u16 fb_readw(const volatile void __iomem *addr)
+static inline u16 fb_readw(const void __iomem *addr)
 {
 	return __raw_readw(addr);
 }
@@ -58,7 +58,7 @@ static inline u16 fb_readw(const volatile void __iomem *addr)
 #endif
 
 #ifndef fb_readl
-static inline u32 fb_readl(const volatile void __iomem *addr)
+static inline u32 fb_readl(const void __iomem *addr)
 {
 	return __raw_readl(addr);
 }
@@ -67,7 +67,7 @@ static inline u32 fb_readl(const volatile void __iomem *addr)
 
 #ifndef fb_readq
 #if defined(__raw_readq)
-static inline u64 fb_readq(const volatile void __iomem *addr)
+static inline u64 fb_readq(const void __iomem *addr)
 {
 	return __raw_readq(addr);
 }
@@ -76,7 +76,7 @@ static inline u64 fb_readq(const volatile void __iomem *addr)
 #endif
 
 #ifndef fb_writeb
-static inline void fb_writeb(u8 b, volatile void __iomem *addr)
+static inline void fb_writeb(u8 b, void __iomem *addr)
 {
 	__raw_writeb(b, addr);
 }
@@ -84,7 +84,7 @@ static inline void fb_writeb(u8 b, volatile void __iomem *addr)
 #endif
 
 #ifndef fb_writew
-static inline void fb_writew(u16 b, volatile void __iomem *addr)
+static inline void fb_writew(u16 b, void __iomem *addr)
 {
 	__raw_writew(b, addr);
 }
@@ -92,7 +92,7 @@ static inline void fb_writew(u16 b, volatile void __iomem *addr)
 #endif
 
 #ifndef fb_writel
-static inline void fb_writel(u32 b, volatile void __iomem *addr)
+static inline void fb_writel(u32 b, void __iomem *addr)
 {
 	__raw_writel(b, addr);
 }
@@ -101,7 +101,7 @@ static inline void fb_writel(u32 b, volatile void __iomem *addr)
 
 #ifndef fb_writeq
 #if defined(__raw_writeq)
-static inline void fb_writeq(u64 b, volatile void __iomem *addr)
+static inline void fb_writeq(u64 b, void __iomem *addr)
 {
 	__raw_writeq(b, addr);
 }
@@ -110,7 +110,7 @@ static inline void fb_writeq(u64 b, volatile void __iomem *addr)
 #endif
 
 #ifndef fb_memcpy_fromio
-static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from, size_t n)
+static inline void fb_memcpy_fromio(void *to, const void __iomem *from, size_t n)
 {
 	memcpy_fromio(to, from, n);
 }
@@ -118,7 +118,7 @@ static inline void fb_memcpy_fromio(void *to, const volatile void __iomem *from,
 #endif
 
 #ifndef fb_memcpy_toio
-static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, size_t n)
+static inline void fb_memcpy_toio(void __iomem *to, const void *from, size_t n)
 {
 	memcpy_toio(to, from, n);
 }
@@ -126,7 +126,7 @@ static inline void fb_memcpy_toio(volatile void __iomem *to, const void *from, s
 #endif
 
 #ifndef fb_memset
-static inline void fb_memset_io(volatile void __iomem *addr, int c, size_t n)
+static inline void fb_memset_io(void __iomem *addr, int c, size_t n)
 {
 	memset_io(addr, c, n);
 }
diff --git a/include/linux/io-64-nonatomic-hi-lo.h b/include/linux/io-64-nonatomic-hi-lo.h
index d3eade7cf663..111b8063a9d9 100644
--- a/include/linux/io-64-nonatomic-hi-lo.h
+++ b/include/linux/io-64-nonatomic-hi-lo.h
@@ -5,9 +5,9 @@
 #include <linux/io.h>
 #include <asm-generic/int-ll64.h>
 
-static inline __u64 hi_lo_readq(const volatile void __iomem *addr)
+static inline __u64 hi_lo_readq(const void __iomem *addr)
 {
-	const volatile u32 __iomem *p = addr;
+	const u32 __iomem *p = addr;
 	u32 low, high;
 
 	high = readl(p + 1);
@@ -16,15 +16,15 @@ static inline __u64 hi_lo_readq(const volatile void __iomem *addr)
 	return low + ((u64)high << 32);
 }
 
-static inline void hi_lo_writeq(__u64 val, volatile void __iomem *addr)
+static inline void hi_lo_writeq(__u64 val, void __iomem *addr)
 {
 	writel(val >> 32, addr + 4);
 	writel(val, addr);
 }
 
-static inline __u64 hi_lo_readq_relaxed(const volatile void __iomem *addr)
+static inline __u64 hi_lo_readq_relaxed(const void __iomem *addr)
 {
-	const volatile u32 __iomem *p = addr;
+	const u32 __iomem *p = addr;
 	u32 low, high;
 
 	high = readl_relaxed(p + 1);
@@ -33,7 +33,7 @@ static inline __u64 hi_lo_readq_relaxed(const volatile void __iomem *addr)
 	return low + ((u64)high << 32);
 }
 
-static inline void hi_lo_writeq_relaxed(__u64 val, volatile void __iomem *addr)
+static inline void hi_lo_writeq_relaxed(__u64 val, void __iomem *addr)
 {
 	writel_relaxed(val >> 32, addr + 4);
 	writel_relaxed(val, addr);
diff --git a/include/linux/io-64-nonatomic-lo-hi.h b/include/linux/io-64-nonatomic-lo-hi.h
index 94e676ec3d3f..259615fe39d4 100644
--- a/include/linux/io-64-nonatomic-lo-hi.h
+++ b/include/linux/io-64-nonatomic-lo-hi.h
@@ -5,9 +5,9 @@
 #include <linux/io.h>
 #include <asm-generic/int-ll64.h>
 
-static inline __u64 lo_hi_readq(const volatile void __iomem *addr)
+static inline __u64 lo_hi_readq(const void __iomem *addr)
 {
-	const volatile u32 __iomem *p = addr;
+	const u32 __iomem *p = addr;
 	u32 low, high;
 
 	low = readl(p);
@@ -16,15 +16,15 @@ static inline __u64 lo_hi_readq(const volatile void __iomem *addr)
 	return low + ((u64)high << 32);
 }
 
-static inline void lo_hi_writeq(__u64 val, volatile void __iomem *addr)
+static inline void lo_hi_writeq(__u64 val, void __iomem *addr)
 {
 	writel(val, addr);
 	writel(val >> 32, addr + 4);
 }
 
-static inline __u64 lo_hi_readq_relaxed(const volatile void __iomem *addr)
+static inline __u64 lo_hi_readq_relaxed(const void __iomem *addr)
 {
-	const volatile u32 __iomem *p = addr;
+	const u32 __iomem *p = addr;
 	u32 low, high;
 
 	low = readl_relaxed(p);
@@ -33,7 +33,7 @@ static inline __u64 lo_hi_readq_relaxed(const volatile void __iomem *addr)
 	return low + ((u64)high << 32);
 }
 
-static inline void lo_hi_writeq_relaxed(__u64 val, volatile void __iomem *addr)
+static inline void lo_hi_writeq_relaxed(__u64 val, void __iomem *addr)
 {
 	writel_relaxed(val, addr);
 	writel_relaxed(val >> 32, addr + 4);
diff --git a/include/linux/io.h b/include/linux/io.h
index 5a430d1f845e..8c0a8e8b6066 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -68,7 +68,7 @@ void __iomem *devm_ioremap_uc(struct device *dev, resource_size_t offset,
 void __iomem *devm_ioremap_wc(struct device *dev, resource_size_t offset,
 				   resource_size_t size);
 void devm_iounmap(struct device *dev, void __iomem *addr);
-int check_signature(const volatile void __iomem *io_addr,
+int check_signature(const void __iomem *io_addr,
 			const unsigned char *signature, int length);
 void devm_ioremap_release(struct device *dev, void *res);
 
diff --git a/lib/check_signature.c b/lib/check_signature.c
index 43a7301da7ab..9d8132d433b5 100644
--- a/lib/check_signature.c
+++ b/lib/check_signature.c
@@ -13,7 +13,7 @@
  *	Returns 1 on a match.
  */
 
-int check_signature(const volatile void __iomem *io_addr,
+int check_signature(const void __iomem *io_addr,
 			const unsigned char *signature, int length)
 {
 	while (length--) {
diff --git a/lib/iomem_copy.c b/lib/iomem_copy.c
index dec7eaea60e0..614c499f196d 100644
--- a/lib/iomem_copy.c
+++ b/lib/iomem_copy.c
@@ -18,7 +18,7 @@
  *
  * Set a range of I/O memory to a given value.
  */
-void memset_io(volatile void __iomem *addr, int val, size_t count)
+void memset_io(void __iomem *addr, int val, size_t count)
 {
 	long qc = (u8)val;
 
@@ -59,7 +59,7 @@ EXPORT_SYMBOL(memset_io);
  *
  * Copy a block of data from I/O memory.
  */
-void memcpy_fromio(void *dst, const volatile void __iomem *src, size_t count)
+void memcpy_fromio(void *dst, const void __iomem *src, size_t count)
 {
 	while (count && !IS_ALIGNED((long)src, sizeof(long))) {
 		*(u8 *)dst = __raw_readb(src);
@@ -101,7 +101,7 @@ EXPORT_SYMBOL(memcpy_fromio);
  *
  * Copy a block of data to I/O memory.
  */
-void memcpy_toio(volatile void __iomem *dst, const void *src, size_t count)
+void memcpy_toio(void __iomem *dst, const void *src, size_t count)
 {
 	while (count && !IS_ALIGNED((long)dst, sizeof(long))) {
 		__raw_writeb(*(u8 *)src, dst);
diff --git a/lib/trace_readwrite.c b/lib/trace_readwrite.c
index a94cd56a1e4c..9c85cdd98a5e 100644
--- a/lib/trace_readwrite.c
+++ b/lib/trace_readwrite.c
@@ -13,7 +13,7 @@
 #include <trace/events/rwmmio.h>
 
 #ifdef CONFIG_TRACE_MMIO_ACCESS
-void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
+void log_write_mmio(u64 val, u8 width, void __iomem *addr,
 		    unsigned long caller_addr, unsigned long caller_addr0)
 {
 	trace_rwmmio_write(caller_addr, caller_addr0, val, width, addr);
@@ -21,7 +21,7 @@ void log_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
 EXPORT_SYMBOL_GPL(log_write_mmio);
 EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_write);
 
-void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
+void log_post_write_mmio(u64 val, u8 width, void __iomem *addr,
 			 unsigned long caller_addr, unsigned long caller_addr0)
 {
 	trace_rwmmio_post_write(caller_addr, caller_addr0, val, width, addr);
@@ -29,7 +29,7 @@ void log_post_write_mmio(u64 val, u8 width, volatile void __iomem *addr,
 EXPORT_SYMBOL_GPL(log_post_write_mmio);
 EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_post_write);
 
-void log_read_mmio(u8 width, const volatile void __iomem *addr,
+void log_read_mmio(u8 width, const void __iomem *addr,
 		   unsigned long caller_addr, unsigned long caller_addr0)
 {
 	trace_rwmmio_read(caller_addr, caller_addr0, width, addr);
@@ -37,7 +37,7 @@ void log_read_mmio(u8 width, const volatile void __iomem *addr,
 EXPORT_SYMBOL_GPL(log_read_mmio);
 EXPORT_TRACEPOINT_SYMBOL_GPL(rwmmio_read);
 
-void log_post_read_mmio(u64 val, u8 width, const volatile void __iomem *addr,
+void log_post_read_mmio(u64 val, u8 width, const void __iomem *addr,
 			unsigned long caller_addr, unsigned long caller_addr0)
 {
 	trace_rwmmio_post_read(caller_addr, caller_addr0, val, width, addr);
diff --git a/mm/ioremap.c b/mm/ioremap.c
index 5cae72004a16..3f5e00d206ec 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -65,7 +65,7 @@ void __iomem *ioremap(phys_addr_t phys_addr, size_t size)
 EXPORT_SYMBOL(ioremap);
 #endif
 
-void generic_iounmap(volatile void __iomem *addr)
+void generic_iounmap(void __iomem *addr)
 {
 	void *vaddr = (void *)((unsigned long)addr & PAGE_MASK);
 
@@ -74,7 +74,7 @@ void generic_iounmap(volatile void __iomem *addr)
 }
 
 #ifndef iounmap
-void iounmap(volatile void __iomem *addr)
+void iounmap(void __iomem *addr)
 {
 	generic_iounmap(addr);
 }
