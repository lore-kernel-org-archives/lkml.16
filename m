Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874A2356CB;
	Wed,  2 Apr 2025 09:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743587917; cv=none; b=dRt97/+fDeIu9yIzzzxawAVI8XbmoTFkKwz7vDD3LfjyG8UdVEclnBavr/0damzfd+d8l0HPwzfecfWkDQfAef+8OVZz9lhyEC/onwMIE6Zc2t9IQSf5ulpL03wMjGuFLSt6bQvN0dYYbrSOymb0XjP8cxO2VeQ0tJqAHw3TuTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743587917; c=relaxed/simple;
	bh=A6B6aja2eONivCgEbLNhcYTNJ9Aom1x9SvOr3WEMcrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mzEf/69eaVNvkCywkWMGEWwiJHg2AQFKLJ7YVo4d7mXzwdpFBfbB1ZyH722o80xA5F5LXGyaacbC6Vjsx+8/UWgwSlqFondBTLF6F2eAvTSOGY0wkCqodiJBQEpodMDhlR5C8V049exaLe/4xQNq3r2u526r1kItQd6CSuW3D7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GR4SvVWh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GR4SvVWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743587913;
	bh=A6B6aja2eONivCgEbLNhcYTNJ9Aom1x9SvOr3WEMcrM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GR4SvVWhvJKv4gRuNuMausHmiTwn543Qnc8f4Rmx+I+ZARUjbVOE4lnWcp8uTQcZd
	 +fXNpHoB9Dc3FF79M7JCJaL4vkZddfWt+Ldp0g1TtAWbwxx7En80sWnmW8Nkefyi8N
	 2Chbk/mzHEgl4hc9oWyiVY7J/7gaOo+YIiQzzqIRW78p2V2RrBd+88YWgM38JQ+8R8
	 vNsyXiFHYd5MwVslnActKE4WXLIax+Jw8LwF62wC72c2PJM7PP4HfPIfYFapDGxyNn
	 mw2bB5ZkMu810VYd/rWAWFMMtiF+JxjNH6ECSKbwmkrBAWe4fptyEFSQm4AFbe45h9
	 nQTL29i0Ho6uw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7423717E014F;
	Wed,  2 Apr 2025 11:58:32 +0200 (CEST)
Message-ID: <dbc60fcb-1759-49e8-90da-6afce5075fbf@collabora.com>
Date: Wed, 2 Apr 2025 11:58:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/3] add VCP mailbox and IPC driver
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250317083822.891-1-jjian.zhou@mediatek.com>
 <375d5281-41f5-49e8-ac20-d58931c0c1f9@collabora.com>
 <CAGXv+5G4KRbv=qcKurn5u300XPp4KNovmUD9OBfX7mKk57tucg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5G4KRbv=qcKurn5u300XPp4KNovmUD9OBfX7mKk57tucg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 18/03/25 08:44, Chen-Yu Tsai ha scritto:
> On Mon, Mar 17, 2025 at 6:07 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 17/03/25 09:38, Jjian Zhou ha scritto:
>>> The VCP mailbox has 5 groups. Each group has corresponding interrupts,
>>> registers, and 64 slots (each slot is 4 bytes). Since different features
>>> share one of the mailbox groups, the VCP mailbox needs to establish a
>>> send table and a receive table. The send table is used to record the
>>> feature ID, mailbox ID, and the number of slots occupied. The receive table
>>> is used to record the feature ID, mailbox ID, the number of slots occupied,
>>> and the receive options. The API setup_mbox_table in mtk-vcp-ipc.c calculates
>>> the slot offset and pin index for each feature ID based on the mailbox ID and
>>> slot number in the send and receive tables (several slots form a pin, and
>>> each pin can trigger an interrupt). These descriptions are written in the
>>> mtk-vcp-ipc.c file -- we call it the IPC layer.
>>>
>>> We have two questions:
>>> How should we describe the mailbox and IPI?
>>> Can the intermediate IPC layer be rewritten as a virtual mailbox layer?
>>>
>>
>> So, for this remote processor messaging system you have:
>>    - Dynamic channel allocation
>>      - Each channel has its own endpoint
> 
> The rpmsg model has:
> 
> - device -> the remote processor
> - channel
> - endpoint
> 
> However here for the VCP and possibly all the coprocessors using the
> tinysys model, channel and endpoint are basically the same.

For now, yes. Though, I expect multiple endpoints to become a thing in future
iterations of MediaTek SoCs, and this is based off how the hardware seems to
be evolving.

> If we
> consider the "channel" to be the storage plus the interrupt vector,
> and the "endpoint" to be the function running on the remote processor
> servicing a given IPI ID, then it's always one endpoint per channel.

Like this, yes - but if you consider ipi_id as the endpoint things will change.

Alternatively, if you consider the endpoint as function running on the remote
processor as you propose, and that I think could be the better alternative,
I still expect functions to grow in future SoCs.

> 
> IMHO rpmsg gives too much latitude to make things confusing here.
> 
> rpmsg also requires the remote processor to support name service
> announcements, which really doesn't exist.

I have doubts about that: all this is not properly documented and a kind of
service announcement could actually be existing - but let's assume that it
does not as that's the right thing to do.

There's still a way around that anyway, and even though it's not the prettiest
thing on Earth, it's not a big deal imo.

> The endpoints and how
> they map to the various hardware mailbox interrupt vectors and
> storage is statically allocated, and thus needs to be described
> in the driver.
> 

I'm not sure I understand this sentence, but it feels like this can be avoided
by simply using a cell in devicetree.

rpmsg = <&something 1 0>;  or  rpmsg = <&something 0>;

>>      - Each channel has its own interrupt
>>    - Data send operation
>>      - Both with and without ACK indication from the remote processor
>>      - To channel -> endpoint
>>    - Data receive operation
>>      - From channel <- endpoint
>>      - When interrupt fires
>>      - Could use polling to avoid blocking in a few cases
>>    - A custom message structure not adhering to any standard
>>
>> Check drivers/rpmsg/ :-)
> 
> While discussing this internally, I felt like that wasn't a really
> correct model. IIUC rpmsg was first created to allow userspace to
> pass messages to the remote processor. Then somehow devices were
> being created on top of those channels.
> 

Heh, if I recall correctly, I did see some userspace messaging in one of the
downstream kernels for other chips that are heavily using the IPI - check below
for a model hint :-)

> Also, the existing mtk_rpmsg driver seemed a bit weird, like requiring
> a DT node for each rpmsg endpoint.
> 

Weird... it's weird, agreed - but I call that necessary evil.
The other way around could be worse (note: that statement is purely by heart and
general knowledge around MediaTek SoCs, not about any specific code in particular).

> That's why I thought mailboxes made more sense, as the terminology mapped
> better. As a result I never brought up rpmsg in the discussion.

I think I do understand your thinking here - and I am not *strongly* disagreeing,
but I don't really agree for the reasons that I'm explaining in this reply.

> 
> Perhaps that could be improved with better documentation for the MediaTek
> specific implementation.
> 

Now that's what I'd really like to see here, because I feel like many things around
MediaTek SoCs are suboptimally engineered (in the software sense, because in the HW
sense I really do like them) and the *primary* reason for this is exactly the lack
of documentation... -> even internally <-.

>> On MediaTek platforms, there are many IPI to handle in many subsystems for
>> all of the remote processors that are integrated in the SoC and, at this
>> point, you might as well just aggregate all of the inter processor communication
>> stuff in one place, having an API that is made just exactly for that, instead
>> of keeping to duplicate the IPI stuff over and over (and yes I know that for each
>> remote processor the TX/RX is slightly different).
>>
>> If you aggregate the IPI messaging in one place, maintenance is going to be easier,
>> and we stop getting duplication... more or less like it was done with the mtk_scp
>> IPI and mtk-vcodec .. and that's also something that is partially handled as RPMSG
>> because, well, it is a remote processor messaging driver.
>>
>> Just to make people understand *how heavily* MediaTek SoCs rely on IPI, there's
>> a *partial* list of SoC IPs that use IPI communcation:
>>
>> thermal, ccu, ccd, tinysys, vcp, atsp, sspm, slbc, mcupm, npu, mvpu, aps, mdla,
>> qos, audio, cm_mgr.... and... again, it's a partial list!
> 
> Indeed, the newest chip has become quite complicated.
> 

..and I'd like to add: for many good reasons :-)

>> That said... any other opinion from anyone else?
> 
> I tried to describe why I thought a virtual mailbox was better.
> 

The implementation issue arising with a virtual mailbox driver is that then each
driver for each IP (thermal, ccu, vcp, slbc, this and that) will contain a direct
copy of the same part-two implementation for IPI communication: this can especially
be seen on downstream kernels for MediaTek Dimensity 9xxx smartphone chips.

If done with a mailbox, there's going to be no way around it - describing it all
will be very long, so I am not doing that right now in this reply, but I invite
you to check the MT6989 kernel to understand what I'm talking about :-)

Cheers!

> 
> Thanks
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> Example of send and recve table:
>>> Operation | mbox_id | ipi_id | msg_size | align_size | slot_ofs | pin_index |  notes
>>> send          0          0       18          18           0          0
>>> recv          0          1       18          18          18          9
>>> send          1         15        8           8           0          0
>>> send          1         16       18          18           8          4
>>> send          1          9        2           2          26         13
>>> recv          1         15        8           8          28         14       ack of send ipi_id=15
>>> recv          1         17       18          18          36         18
>>> recv          1         10        2           2          54         27       ack of send ipi_id=2
>>> send          2         11       18          18           0          0
>>> send          2          2        2           2          18          9
>>> send          2          3        3           4          20         10
>>> send          2         32        2           2          24         12
>>> recv          2         12       18          18          26         13
>>> recv          2          5        1           2          44         22
>>> recv          2          2        1           2          46         23
>>>
>>> Recv ipi_id=2 is the ack of send ipi_id=2(The ipi_id=15 is the same.)
>>>
>>> Jjian Zhou (3):
>>>     mailbox: mediatek: Add mtk-vcp-mailbox driver
>>>     firmware: mediatek: Add vcp ipc protocol interface
>>>     dt-bindings: mailbox: mtk,vcp-mbox: add mtk vcp-mbox document
>>>
>>>    .../bindings/mailbox/mtk,mt8196-vcp-mbox.yaml |  49 ++
>>>    drivers/firmware/Kconfig                      |   9 +
>>>    drivers/firmware/Makefile                     |   1 +
>>>    drivers/firmware/mtk-vcp-ipc.c                | 481 ++++++++++++++++++
>>>    drivers/mailbox/Kconfig                       |   9 +
>>>    drivers/mailbox/Makefile                      |   2 +
>>>    drivers/mailbox/mtk-vcp-mailbox.c             | 179 +++++++
>>>    include/linux/firmware/mediatek/mtk-vcp-ipc.h | 151 ++++++
>>>    include/linux/mailbox/mtk-vcp-mailbox.h       |  34 ++
>>>    9 files changed, 915 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/mailbox/mtk,mt8196-vcp-mbox.yaml
>>>    create mode 100644 drivers/firmware/mtk-vcp-ipc.c
>>>    create mode 100644 drivers/mailbox/mtk-vcp-mailbox.c
>>>    create mode 100644 include/linux/firmware/mediatek/mtk-vcp-ipc.h
>>>    create mode 100644 include/linux/mailbox/mtk-vcp-mailbox.h
>>>
>>
>>
>>
