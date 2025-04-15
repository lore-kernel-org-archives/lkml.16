Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6062185A0;
	Tue, 15 Apr 2025 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736047; cv=none; b=LoIjygh4lvNWzQR3fmOkR8MzirxYQZCYZe605Eq/fMlbTo9JjitI0CkzpIiiX0xg+NRcxVgkef+lqQ59gpD73bpKT7VNXwp3rJr0nrDGM+o+O660ZPdo2ZDQjWtm3a+yZ6q5VbGa/Uxiy7wlDrKsDhjwcoCCI/Qb1i1Cavr4k7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736047; c=relaxed/simple;
	bh=pNBVD6sTwdfGCzh+dClz+srq7rjA4Bq1d0DzhRVMpxM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lNjRpAWFhSeZ8dV3Ds6G0rOq/9imvnOQAUPXrui6cpf+8klB8vGysrCJSjBTUx9ln1e2T75bA4oJZ112mb8N5nvrn37lwcAd2Iv6oaBY4Qhc0JkHH1tw4tTuI+WO+J5y3uj69QskIyThydJjVcpZPoTAFlJNMHfuxHsvzQ5QxEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=l+aruumS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Glfi+Lyu; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="l+aruumS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Glfi+Lyu"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 753491380402;
	Tue, 15 Apr 2025 12:54:03 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 15 Apr 2025 12:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744736043;
	 x=1744822443; bh=GsZcNVUpWbWIN1zLSpeEH6hGBDYQ8/SwMYt4EI0wCNw=; b=
	l+aruumS3ieGcQUTk1dMZg7K5s2KJ/pR1xJX89EtifyjZyMivn/1FlO1Xtpy1Ihb
	FbmG7AZWrZNacNCOxTO1hx5u3ehxHgT6cqk2KgtgmVvRvlzMOo9lKL6Nn92mvXyx
	c+dLBNNAygSU5AYCE7GDo3UkUCSHrct9zAadkvDjx6/o8LvCD81cdixel79hV/k1
	eVBVdQ6ip81W3/SG9uDZ/+5qb1/dj9cZxUQxQozNi+S4+8+RpwTZFhdJIjBNUFMH
	EfqL7jMHSbAG5BrsMI3gbwKC8/5g872QLfWD0yJvHyVFSoeeD9H21xGPAwydOvZm
	wkS3jsjiRvgGv8Q1mI14Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744736043; x=
	1744822443; bh=GsZcNVUpWbWIN1zLSpeEH6hGBDYQ8/SwMYt4EI0wCNw=; b=G
	lfi+LyuqZU8xgbnVfRJwr6n3yYxCpz08kJ1s5vSYY+6MWY94OrZjo3+BlgYID3JY
	bUAypESu6AOUfqqHIkjg69V2SeQuu7UPh1dT+3Hqh1iRRpx6QvapPoIG6Ae7HAjg
	anKuQEq+ZRpEWy+tejDJlTaylDDq2nGURhX+ERXTSZ206fk987Wg216qPOTABADB
	1cJfUR1MNno9z2Yv20bzgF1u7H4MIJi+gWxcWVNOk93nl3wYGOsQcttoUQPvMRlY
	5YftAGWLixfjTbsCHzo08vBLPj6ncJ+SVTGTGsr2TbKKTAjKNXdgy+yqYTKaXy68
	f1XTqiTnBf+XtUxZJuugQ==
X-ME-Sender: <xms:Ko_-Z8SXlolJy1NoF6_4jeXelQd9hszkNd8SXvUP7gy3tMJL54lzPg>
    <xme:Ko_-Z5zSHgrIchPwJ4h0sPoibHkaxzQj6V-hCjh5jQaKC3pXxkIrs9HKoTIOj0EUT
    FmZWXfh8OJy7Y4h2sU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdegtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
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
X-ME-Proxy: <xmx:Ko_-Z50siGfrd4hX-IdjpdzQjhf_3POHTuRiyxixr_CBU3hmTYAt1A>
    <xmx:Ko_-ZwB5r_gE66PrUoetwEDaxVvKYlV0N07rsaDS3x5XzB77ncQwMw>
    <xmx:Ko_-Z1hJsFHrF7EaK0GVdCnPKzPZ7BH-jJw_p8xVmVnw6O2rJURI0g>
    <xmx:Ko_-Z8rm-pdrpNjKyxGqb4Jh-X4SvabrkqwnnK69QrlKHUIhy1xSSA>
    <xmx:K4_-Z5v-PhsD8K9yWarQy_d0UWBOPMX2AOJiD27EzY3omt3kwhj9dt5w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4C5AC2220073; Tue, 15 Apr 2025 12:54:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T34c2e9587870dbea
Date: Tue, 15 Apr 2025 18:53:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, logang@deltatee.com,
 "Stephen Bates" <sbates@raithlin.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Dinh Nguyen" <dinguyen@kernel.org>
Message-Id: <0c844b70-19c7-4b14-ba29-fc99ae0d69f0@app.fastmail.com>
In-Reply-To: 
 <CANiq72=Grg+T-c0+TxcyubHj4kvHPQKiVm3AZp5DgeUVXsitEQ@mail.gmail.com>
References: <20250412005341.157150-1-fujita.tomonori@gmail.com>
 <CANiq72=Grg+T-c0+TxcyubHj4kvHPQKiVm3AZp5DgeUVXsitEQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: helpers: Remove volatile qualifier from io helpers
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025, at 18:28, Miguel Ojeda wrote:
> On Sat, Apr 12, 2025 at 2:54=E2=80=AFAM FUJITA Tomonori <fujita.tomono=
ri@gmail.com> wrote:
>>
>> /home/fujita/git/linux-rust/arch/um/include/asm/io.h:19:42: note: pas=
sing argument to parameter 'addr' here
>>    19 | static inline void iounmap(void __iomem *addr)
>>       |                                          ^
>> 1 error generated.
>>
>> Fixes: ce30d94e6855 ("rust: add `io::{Io, IoRaw}` base types")
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> I don't particularly like having different signatures than the other
> side (since we could e.g. eventually have a check that they match
> etc.), but given v1 it seems they could also be eventually gone from
> the C side anyway.

Rihgt, I tried this last week when it came up first, removing the
'volatile' annotations in the asm-generic/io.h header and then
all the ones that caused build regressions on arm/arm64/x86
randconfig and allmodconfig builds.  This patch is a little
longer than my original version as I did run into a few
regressions later.

As far as I can tell, none of these volatile annotations have
any actual effect, and most of them date back to ancient kernels
where this may have been required.

Leaving it out of the rust interface is clearly the right way,
and it shouldn't be too hard to upstream the changes below
when we need to, but I also don't see any priority to send these.
If anyone wants to help out, I can send them the whole patch.

       Arnd

 arch/sh/include/cpu-sh4/cpu/sh7786.h            |   2 +-
 arch/x86/include/asm/io.h                       |  14 +-
 arch/x86/include/asm/uv/uv_hub.h                |   2 +-
 arch/x86/lib/iomem.c                            |  18 +-
 arch/x86/mm/ioremap.c                           |   5 +-
 drivers/accel/qaic/qaic_timesync.c              |   4 +-
 drivers/atm/fore200e.c                          |  12 +-
 drivers/atm/fore200e.h                          |  10 +-
 drivers/char/agp/amd-k7-agp.c                   |   4 +-
 drivers/char/agp/ati-agp.c                      |   6 +-
 drivers/char/agp/nvidia-agp.c                   |   5 +-
 drivers/char/agp/sworks-agp.c                   |   4 +-
 drivers/media/pci/bt8xx/bt878.c                 |   2 +-
 drivers/media/pci/bt8xx/bt878.h                 |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.h            |   8 +-
 drivers/media/pci/ivtv/ivtv-firmware.c          |  10 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c             |   2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c           |   6 +-
 drivers/media/pci/ivtv/ivtvfb.c                 |   2 +-
 drivers/mtd/devices/spear_smi.c                 |   2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.h       |   5 +-
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h      |   4 +-
 drivers/net/ethernet/chelsio/cxgb4vf/adapter.h  |   4 +-
 drivers/net/ethernet/via/via-velocity.h         | 184 ++++++------
 drivers/net/wireless/ath/wil6210/fw.c           |   4 +-
 drivers/net/wireless/ath/wil6210/main.c         |   8 +-
 drivers/net/wireless/ath/wil6210/wil6210.h      |   6 +-
 drivers/scsi/aacraid/aacraid.h                  |   5 +-
 drivers/scsi/aacraid/rx.c                       |   2 +-
 drivers/scsi/aic7xxx/aic79xx_osm.h              |   2 +-
 drivers/scsi/aic7xxx/aic7xxx_osm.h              |   2 +-
 drivers/scsi/megaraid/megaraid_sas.h            |   2 +-
 drivers/scsi/megaraid/megaraid_sas_base.c       |   2 +-
 drivers/scsi/mpi3mr/mpi3mr.h                    |   2 +-
 drivers/scsi/mpi3mr/mpi3mr_fw.c                 |   4 +-
 drivers/scsi/mpt3sas/mpt3sas_base.c             |   7 +-
 drivers/scsi/nsp32_io.h                         |  52 ++--
 drivers/scsi/qla1280.c                          |   4 +-
 drivers/scsi/qla2xxx/qla_def.h                  |  18 +-
 drivers/scsi/qla2xxx/qla_inline.h               |   2 +-
 drivers/scsi/smartpqi/smartpqi_init.c           |   2 +-
 drivers/spi/spi-s3c64xx.c                       |   4 +-
 drivers/staging/sm750fb/sm750.h                 |   6 +-
 drivers/video/fbdev/imsttfb.c                   |   4 +-
 drivers/video/fbdev/kyro/STG4000InitDevice.c    |   4 +-
 drivers/video/fbdev/kyro/STG4000Interface.h     |  26 +-
 drivers/video/fbdev/kyro/STG4000OverlayDevice.c |  10 +-
 drivers/video/fbdev/kyro/STG4000Ramdac.c        |   6 +-
 drivers/video/fbdev/kyro/STG4000Reg.h           | 376 ++++++++++++-----=
-------
 drivers/video/fbdev/kyro/STG4000VTG.c           |   8 +-
 drivers/video/fbdev/nvidia/nv_type.h            |  38 +--
 drivers/video/fbdev/nvidia/nvidia.c             |   9 +-
 drivers/video/fbdev/riva/fbdev.c                |   2 +-
 drivers/video/fbdev/riva/nv_driver.c            |  26 +-
 drivers/video/fbdev/riva/riva_hw.h              |  60 ++--
 drivers/video/fbdev/savage/savagefb.h           |   4 +-
 drivers/video/fbdev/vga16fb.c                   |   2 +-
 include/asm-generic/io.h                        | 136 ++++-----
 include/asm-generic/video.h                     |  22 +-
 include/linux/io-64-nonatomic-hi-lo.h           |  12 +-
 include/linux/io-64-nonatomic-lo-hi.h           |  12 +-
 include/linux/io.h                              |   2 +-
 include/video/neomagic.h                        |   2 +-
 lib/check_signature.c                           |   2 +-
 lib/iomem_copy.c                                |   6 +-
 lib/trace_readwrite.c                           |   8 +-
 mm/ioremap.c                                    |   4 +-
 tools/testing/nvdimm/test/iomap.c               |   2 +-
 tools/testing/nvdimm/test/nfit_test.h           |   2 +-
 69 files changed, 613 insertions(+), 623 deletions(-)
