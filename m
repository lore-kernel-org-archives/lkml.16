Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766731865FA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874210; cv=none; b=FcedAYkrhFth45aTXC6R694v72F2HWWSOzc8eawEOXolZnLhaYpeY0c8Z8WNSkOBSqzSIVMm4GyFXf34bIWAiRkUI3IITQ13zbSd3UtWTMF+SBsryvJoGUpnYF5O1VHcAAO6+RzqY4QXMZtDOZkoplDRoEdeBGRVq+/+DSxNJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874210; c=relaxed/simple;
	bh=MX0IdD1U9geWBV3o2UciI05J9+smrC9yf+cOK7+Kq2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b5i6OrAoVZmoiPecf8CdqrQQYFnc6Xv0GjCdZdOH05rxNveECSbYTo2kCCa8WUjZUmqP/12hhubdfdggEZn/fkfsqODrMu5AsWBOsjm4xhYU1v+KDDzvwi+cEqxY7kKHLF3NEG/4ggDQ77PHULy6A3cJrM2EVduR7iBO1SRBlZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JVOXR6is; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JVOXR6is"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549b159c84cso569756e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744874206; x=1745479006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSu41B/073E+BmbBPL0RX6pQMcurIbuXS1d0yZLR2sY=;
        b=JVOXR6isNlG1XsgDzPFTW6qQzXA6Y9eG1eaYVS7AWMzqVZ2DxTM1iywN4NdvEcyrvy
         6w0uP26FTAWo0irmKc59wBeMk0NgVb/22wQcwpCg32ybGUR4ZUwacWVcjaJfIgF8fpb4
         Jxlx/Ujedpzko6xoFyou/0v0QYEer3rzrD2n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874206; x=1745479006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSu41B/073E+BmbBPL0RX6pQMcurIbuXS1d0yZLR2sY=;
        b=b3DJfIwkH5CtrtoLCfcQ/Fgs57S/hFdRXBoOP9PcFKTGTnYuwGvgaDQESTQ5QtoA72
         l1uGcPqaJaEqfnx1Lv48v4w3zzlSfrWOf7OX3phTYwulkYeq7ND91tsJ4Q6hbMgTTasp
         haZS0LIa/G08pdda3D1hvmjwrQOQU3Gbu6473uWtfnMc3blzeZzK1M1/7w/zT2h0Um/0
         OLIG8s0rwhPeaFPzjM3c6B1vo4hCN7LrBOLquOnDpRpad0XyWDD2eombsMxmmXPFIVjU
         UkTFZq8uP7wadd3uHP6WPJgMwAIDoAEx3m3Mgo14Q3AfpN0XPzTI6k2E8rLScdweV67D
         nPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPYrNDh21gNbwqhY6aJLjLzrd56lCg893Cu2p26KBWPeMqGUrmQT917/Ys8fbeRV0mWUJyOce9QOvUqk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbzEBHdTXD5sYRR6WdaopH/dlUcxBp61eSSYG7O+gZDX20b+Us
	LDnmP+cdLcblSEjO0ifGpRMX1QfWBHDNSOM2LB0+Urlbfup6ZwShxQ8u2RGWlcpLQhtcaceei+Q
	qQXm8/AnZBq4JWQmSjJvphadD0uy/MSjXJKmZ
X-Gm-Gg: ASbGncuQzuwa/OZnH3zpLeAD243N9Fq81uCJdnV8ovks4H20nhhmGbkiVwGANIwSmkj
	tAnZKwJaMlLfAT10gjdKAI8lZpTL54/0tzzcKAHt9FHmJmN83TIxB9gEHPTnV9P8YZtMq0HTAy3
	R7xXMQBXzd5H4J4Zc5ot4eNFl77V5ictcTgwSzvD856qFJ+BFgQQ==
X-Google-Smtp-Source: AGHT+IE55YBoHKt1cqUQ/q9enTP2N5DYuWb68KXh7Y0d6a3dhKUWY0alWZkAPJSqLFDg1OolN5gYCpvah5VGX2l2C5o=
X-Received: by 2002:a05:6512:3b13:b0:549:8cbb:5441 with SMTP id
 2adb3069b0e04-54d64a9c19amr1556192e87.15.1744874206243; Thu, 17 Apr 2025
 00:16:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317083822.891-1-jjian.zhou@mediatek.com> <375d5281-41f5-49e8-ac20-d58931c0c1f9@collabora.com>
 <CAGXv+5G4KRbv=qcKurn5u300XPp4KNovmUD9OBfX7mKk57tucg@mail.gmail.com> <dbc60fcb-1759-49e8-90da-6afce5075fbf@collabora.com>
In-Reply-To: <dbc60fcb-1759-49e8-90da-6afce5075fbf@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Apr 2025 15:16:34 +0800
X-Gm-Features: ATxdqUGJkdmLzcyorX63OQZAnZ_VSf2hf9dsS-2r-IO5DX-6A2TwrOJBmPmRNJE
Message-ID: <CAGXv+5FXqZb_v2dQNgCKbFpJrLhbVk3f0sWrrMCVk3jaWwoBqA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/3] add VCP mailbox and IPC driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for the late reply.

On Wed, Apr 2, 2025 at 5:58=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 18/03/25 08:44, Chen-Yu Tsai ha scritto:
> > On Mon, Mar 17, 2025 at 6:07=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 17/03/25 09:38, Jjian Zhou ha scritto:
> >>> The VCP mailbox has 5 groups. Each group has corresponding interrupts=
,
> >>> registers, and 64 slots (each slot is 4 bytes). Since different featu=
res
> >>> share one of the mailbox groups, the VCP mailbox needs to establish a
> >>> send table and a receive table. The send table is used to record the
> >>> feature ID, mailbox ID, and the number of slots occupied. The receive=
 table
> >>> is used to record the feature ID, mailbox ID, the number of slots occ=
upied,
> >>> and the receive options. The API setup_mbox_table in mtk-vcp-ipc.c ca=
lculates
> >>> the slot offset and pin index for each feature ID based on the mailbo=
x ID and
> >>> slot number in the send and receive tables (several slots form a pin,=
 and
> >>> each pin can trigger an interrupt). These descriptions are written in=
 the
> >>> mtk-vcp-ipc.c file -- we call it the IPC layer.
> >>>
> >>> We have two questions:
> >>> How should we describe the mailbox and IPI?
> >>> Can the intermediate IPC layer be rewritten as a virtual mailbox laye=
r?
> >>>
> >>
> >> So, for this remote processor messaging system you have:
> >>    - Dynamic channel allocation
> >>      - Each channel has its own endpoint
> >
> > The rpmsg model has:
> >
> > - device -> the remote processor
> > - channel
> > - endpoint
> >
> > However here for the VCP and possibly all the coprocessors using the
> > tinysys model, channel and endpoint are basically the same.
>
> For now, yes. Though, I expect multiple endpoints to become a thing in fu=
ture
> iterations of MediaTek SoCs, and this is based off how the hardware seems=
 to
> be evolving.

I don't see it happening yet. What I think will happen is they will add
more coprocessors and corresponding mailbox controllers. And I think we
should focus on what the current firmware implements and try to model
that.

I think we should just ask MediaTek if their firmware interface is fixed
and what they would do if they ran out of IPI space.

> > If we
> > consider the "channel" to be the storage plus the interrupt vector,
> > and the "endpoint" to be the function running on the remote processor
> > servicing a given IPI ID, then it's always one endpoint per channel.
>
> Like this, yes - but if you consider ipi_id as the endpoint things will c=
hange.
>
> Alternatively, if you consider the endpoint as function running on the re=
mote
> processor as you propose, and that I think could be the better alternativ=
e,
> I still expect functions to grow in future SoCs.

Sure, but it's more than likely they will add more IPIs to handle that.

> >
> > IMHO rpmsg gives too much latitude to make things confusing here.
> >
> > rpmsg also requires the remote processor to support name service
> > announcements, which really doesn't exist.
>
> I have doubts about that: all this is not properly documented and a kind =
of
> service announcement could actually be existing - but let's assume that i=
t
> does not as that's the right thing to do.
>
> There's still a way around that anyway, and even though it's not the pret=
tiest
> thing on Earth, it's not a big deal imo.
>
> > The endpoints and how
> > they map to the various hardware mailbox interrupt vectors and
> > storage is statically allocated, and thus needs to be described
> > in the driver.
> >
>
> I'm not sure I understand this sentence, but it feels like this can be av=
oided
> by simply using a cell in devicetree.
>
> rpmsg =3D <&something 1 0>;  or  rpmsg =3D <&something 0>;

That could work. Then again rpmsg is some software construct. Also not
all coprocessors implement the same thing. See below.

> >>      - Each channel has its own interrupt
> >>    - Data send operation
> >>      - Both with and without ACK indication from the remote processor
> >>      - To channel -> endpoint
> >>    - Data receive operation
> >>      - From channel <- endpoint
> >>      - When interrupt fires
> >>      - Could use polling to avoid blocking in a few cases
> >>    - A custom message structure not adhering to any standard
> >>
> >> Check drivers/rpmsg/ :-)
> >
> > While discussing this internally, I felt like that wasn't a really
> > correct model. IIUC rpmsg was first created to allow userspace to
> > pass messages to the remote processor. Then somehow devices were
> > being created on top of those channels.
> >
>
> Heh, if I recall correctly, I did see some userspace messaging in one of =
the
> downstream kernels for other chips that are heavily using the IPI - check=
 below
> for a model hint :-)

Is that direct messaging or going through some ioctl interface? I think
direct messaging to some system critical firmware without any sanity
checks is potentially dangerous.

> > Also, the existing mtk_rpmsg driver seemed a bit weird, like requiring
> > a DT node for each rpmsg endpoint.
> >
>
> Weird... it's weird, agreed - but I call that necessary evil.
> The other way around could be worse (note: that statement is purely by he=
art and
> general knowledge around MediaTek SoCs, not about any specific code in pa=
rticular).
>
> > That's why I thought mailboxes made more sense, as the terminology mapp=
ed
> > better. As a result I never brought up rpmsg in the discussion.
>
> I think I do understand your thinking here - and I am not *strongly* disa=
greeing,
> but I don't really agree for the reasons that I'm explaining in this repl=
y.
>
> >
> > Perhaps that could be improved with better documentation for the MediaT=
ek
> > specific implementation.
> >
>
> Now that's what I'd really like to see here, because I feel like many thi=
ngs around
> MediaTek SoCs are suboptimally engineered (in the software sense, because=
 in the HW
> sense I really do like them) and the *primary* reason for this is exactly=
 the lack
> of documentation... -> even internally <-.

That I agree with.

> >> On MediaTek platforms, there are many IPI to handle in many subsystems=
 for
> >> all of the remote processors that are integrated in the SoC and, at th=
is
> >> point, you might as well just aggregate all of the inter processor com=
munication
> >> stuff in one place, having an API that is made just exactly for that, =
instead
> >> of keeping to duplicate the IPI stuff over and over (and yes I know th=
at for each
> >> remote processor the TX/RX is slightly different).
> >>
> >> If you aggregate the IPI messaging in one place, maintenance is going =
to be easier,
> >> and we stop getting duplication... more or less like it was done with =
the mtk_scp
> >> IPI and mtk-vcodec .. and that's also something that is partially hand=
led as RPMSG
> >> because, well, it is a remote processor messaging driver.
> >>
> >> Just to make people understand *how heavily* MediaTek SoCs rely on IPI=
, there's
> >> a *partial* list of SoC IPs that use IPI communcation:
> >>
> >> thermal, ccu, ccd, tinysys, vcp, atsp, sspm, slbc, mcupm, npu, mvpu, a=
ps, mdla,
> >> qos, audio, cm_mgr.... and... again, it's a partial list!
> >
> > Indeed, the newest chip has become quite complicated.
> >
>
> ..and I'd like to add: for many good reasons :-)

It also creates new problems, such as resource handover. There are
internal regulators or clock controls that are controlled by the
firmware after the coprocessor is brought up. But until then, in
some cases those resources are still under the control of the kernel;
in other cases they are left turned on by the bootloader so as not
to block consumers. Some delicate (read: fragile) handover was done,
which I'm not very fond of.

> >> That said... any other opinion from anyone else?
> >
> > I tried to describe why I thought a virtual mailbox was better.
> >
>
> The implementation issue arising with a virtual mailbox driver is that th=
en each
> driver for each IP (thermal, ccu, vcp, slbc, this and that) will contain =
a direct
> copy of the same part-two implementation for IPI communication: this can =
especially
> be seen on downstream kernels for MediaTek Dimensity 9xxx smartphone chip=
s.

For the code that MediaTek has provided for MT8196, I can say that there
are at least three types of firmware interfaces:

- ADSP

We're running SOF, so that might be different from the Android stuff that
you saw for 9300. The ADSP mailboxes don't have any shared storage or
channels. They are simply doorbells. The shared storage interface is
likely common to SOF implementations

- Tinysys over SCMI

This seems to be the main coprocessor, which seems to be the SSPM.
Judging by the associated drivers, the firmware implements a vendor
extension protocol (0x80) over SCMI, over which it provides various
commands.

From the code we have it looks like this part manages the QOS, SLBC, and
CM_MGR parts.

- Tinysys over mailbox controllers (with scratch registers)

This covers the other coprocessors such as VCP, GPUEB, MCUPM and
probably others that we don't currently have included in our tree.
This is the part we are discussing.

Given how the communication channels are crammed into the mailboxes,
it's unlikely you can get rid of said part-two implementation. There
needs to be something that maps individual channels onto the mailbox
channels and combined storage. The question is simply how we want to
model this. And regardless of whether it be rpmsg or virtual mailbox,
we will end up with some shared library code to implement this
translation. This is what currently exists as mtk-mbox.c and
mtk_tinysys_ipi.c under drivers/soc/mediaktek/ in our tree. I assume
there is something similar in the code that you have, given that
most of the code we have for MT8196 was ported over from their
internal trees without much modification.

mtk-mbox.c handles the grouped mailboxes, while mtk_tinysys_ipi.c provides
the IPI interface. I assume the latter is what you are referring to as
"part-two IPI". mtk_tinysys_ipi.c goes even further as it builds the
IPI interface on top of rpmsg (implemented in drivers/rpmsg/mtk_rpmsg_mbox.=
c).

What I would like to see is to drop the low level mailbox stuff from
mtk-mbox.c, move the mailbox combining and repartitioning bits to a
library that implements the IPI interface, using rpmsg or virtual
mailboxes or whatever. I don't see why this would end up with multiple
copies. The only thing that coprocessor drivers need to have is a
table on how the IPIs map to the mailboxes.

> If done with a mailbox, there's going to be no way around it - describing=
 it all
> will be very long, so I am not doing that right now in this reply, but I =
invite
> you to check the MT6989 kernel to understand what I'm talking about :-)

You'll have to provide a link to that. However I think a lot of the code
for MT8196 is derived from the same source.


Thanks
ChenYu


> Cheers!
>
> >
> > Thanks
> > ChenYu
> >
> >> Cheers,
> >> Angelo
> >>
> >>> Example of send and recve table:
> >>> Operation | mbox_id | ipi_id | msg_size | align_size | slot_ofs | pin=
_index |  notes
> >>> send          0          0       18          18           0          =
0
> >>> recv          0          1       18          18          18          =
9
> >>> send          1         15        8           8           0          =
0
> >>> send          1         16       18          18           8          =
4
> >>> send          1          9        2           2          26         1=
3
> >>> recv          1         15        8           8          28         1=
4       ack of send ipi_id=3D15
> >>> recv          1         17       18          18          36         1=
8
> >>> recv          1         10        2           2          54         2=
7       ack of send ipi_id=3D2
> >>> send          2         11       18          18           0          =
0
> >>> send          2          2        2           2          18          =
9
> >>> send          2          3        3           4          20         1=
0
> >>> send          2         32        2           2          24         1=
2
> >>> recv          2         12       18          18          26         1=
3
> >>> recv          2          5        1           2          44         2=
2
> >>> recv          2          2        1           2          46         2=
3
> >>>
> >>> Recv ipi_id=3D2 is the ack of send ipi_id=3D2(The ipi_id=3D15 is the =
same.)
> >>>
> >>> Jjian Zhou (3):
> >>>     mailbox: mediatek: Add mtk-vcp-mailbox driver
> >>>     firmware: mediatek: Add vcp ipc protocol interface
> >>>     dt-bindings: mailbox: mtk,vcp-mbox: add mtk vcp-mbox document
> >>>
> >>>    .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml |  49 ++
> >>>    drivers/firmware/Kconfig                      |   9 +
> >>>    drivers/firmware/Makefile                     |   1 +
> >>>    drivers/firmware/mtk-vcp-ipc.c                | 481 ++++++++++++++=
++++
> >>>    drivers/mailbox/Kconfig                       |   9 +
> >>>    drivers/mailbox/Makefile                      |   2 +
> >>>    drivers/mailbox/mtk-vcp-mailbox.c             | 179 +++++++
> >>>    include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++++
> >>>    include/linux/mailbox/mtk-vcp-mailbox.h       |  34 ++
> >>>    9 files changed, 915 insertions(+)
> >>>    create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,m=
t8196-vcp-mbox.yaml
> >>>    create mode 100644 drivers/firmware/mtk-vcp-ipc.c
> >>>    create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
> >>>    create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
> >>>    create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
> >>>
> >>
> >>
> >>
