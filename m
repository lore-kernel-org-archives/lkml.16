Received: from smtpa31.poczta.onet.pl (smtpa31.poczta.onet.pl [213.180.142.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E840A923
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.180.142.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746350165; cv=none; b=WzjEiOuuQQfDFCEJUhUdtSmyuEwGBqj51Gl7cUry3RAiQ/hZyak6EpOgbkDeeaAbuX4XcPnVt8Gz3paE7A9VCmgj4Osir+b/EgHoUt5hGpeCC+IzF14u7QrAMgBebEUrkQJQRbQHHZLbMuHrRmvrf1WPRclVickpFOKl7HozqY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746350165; c=relaxed/simple;
	bh=mq+6j7ktZrw66k9T8yUoPtSnNa5t0kBfoA+H3MYaNz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I5oBeQrytZrp0xxzr9nAx7PQadFKn9Zzdq35M5mfVGyEN/dJETjM+K2LGJDuMfrWM7CHQyUOPIEqP4agghuOxOn0D8sv+IrYyZvBQu/Wp5JCKLOO/61aEzeMxaPsJ0eODfSZJ4rw6mt9j8G+R/2hx/Lw6StXdOay7NE+o9Y+tXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl; spf=pass smtp.mailfrom=op.pl; dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b=UeTDik5U; arc=none smtp.client-ip=213.180.142.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=op.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=op.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=op.pl header.i=@op.pl header.b="UeTDik5U"
Received: from [192.168.88.101] (unknown [185.127.22.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: dragonn@op.pl)
	by smtp.poczta.onet.pl (Onet) with ESMTPSA id 4ZqzWC4cgPzlg9pD;
	Sun,  4 May 2025 11:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
	t=1746350078; bh=XFHj4WTMsQWKLeISHAagqY5NYvbX3fcPg1+0izjZ2L4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UeTDik5U+wHNfWq/6BZ5eStGps5dtm7A9JTvCtbWCBVM1baCwHZiRN5R5n4VSB8kb
	 16vQ3SgS80aYsNnp2IrbnrDatfZVh/vU/vmO2+d8CocZyxG+ICpOm2qjeBXa0QZLmN
	 B4SywC3y4WhBen0o5pxDYySo7QuVmvoRDV/HCMJ8=
Message-ID: <df99891d-1723-41a7-b36f-ef57dc8eb4bf@op.pl>
Date: Sun, 4 May 2025 11:13:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mei: vsc: Fix fortify-panic caused by invalid
 counted_by() use
To: Hans de Goede <hdegoede@redhat.com>, Wentong Wu <wentong.wu@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250318141203.94342-1-hdegoede@redhat.com>
 <20250318141203.94342-2-hdegoede@redhat.com>
 <4db60fd6-ffd7-43d8-967b-38d6dae5be71@op.pl>
 <0f838e71-429c-4029-8aba-f6389f6bba7d@redhat.com>
Content-Language: en-US
From: Mateusz Schyboll <dragonn@op.pl>
In-Reply-To: <0f838e71-429c-4029-8aba-f6389f6bba7d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Either way looking at the back trace it seems that you are using
> bcachefs and this is a bcache fs issue (bch2_xattr_get_trans()
> is defined in fs/bcachefs/xattr.c).
>
> Please report this to the bcachefs developer. Note it would be
> good to note in your report to Kent that this is triggered by gcc15.
Right, that game I am trying to run is stored on bcachefs (where the 
rest of my system is ext4, with explains why only this has issues). 
Thanks for the hint, reported on github 
https://github.com/koverstreet/bcachefs/issues/874

W dniu 4.05.2025 o 10:56, Hans de Goede pisze:
> Hi Mateusz,
>
> On 4-May-25 10:25 AM, Mateusz Schyboll wrote:
>> Hi,
>>
>> found this patch while searching for a I think a similar bug on 6.14.4 compiled with gcc 15:
>>
>> [  121.966267] memcpy: detected buffer overflow: 3 byte read of buffer size 18446744073709551615
> <snip.
>
>> [  121.966409] Call Trace:
>> [  121.966411]  <TASK>
>> [  121.966412]  __fortify_panic+0xd/0xf
>> [  121.966416]  bch2_xattr_get_trans.cold+0xe/0xe [bcachefs b5391e24358551d6754989dda9ec90add2ece543]
> <snip>
>
>> Unfortunately even with this patch the bug still shows up, so I am not 100% sure this is exactly the same , the call trace is diffirent so maybe a similar bug but in a diffirent subsystem?
> That is not surprising, this really is a totally different bug,
> which happens to also trigger a fortify panic and that you're seeing
> this bug now that arch has switched to gcc15 indicates that it indeed
> is triggered by gcc15 now supporting counted_by().
>
> This could either be a real bug in the kernel which now gets caught or
> another invalid counted_by() use.
>
> Either way looking at the back trace it seems that you are using
> bcachefs and this is a bcache fs issue (bch2_xattr_get_trans()
> is defined in fs/bcachefs/xattr.c).
>
> Please report this to the bcachefs developer. Note it would be
> good to note in your report to Kent that this is triggered by gcc15.
>
> Regards,
>
> Hans
>
>
>
>
>
>> The behavior from user space is that I am trying to launch Tiny Tina's Wonderlands and that pops up after the optimizing shaders finishes and the game never launches, it gets stuck after that.
>>
>> W dniu 18.03.2025 o 15:12, Hans de Goede pisze:
>>> gcc 15 honors the __counted_by(len) attribute on vsc_tp_packet.buf[]
>>> and the vsc-tp.c code is using this in a wrong way. len does not contain
>>> the available size in the buffer, it contains the actual packet length
>>> *without* the crc. So as soon as vsc_tp_xfer() tries to add the crc to
>>> buf[] the fortify-panic handler gets triggered:
>>>
>>> [   80.842193] memcpy: detected buffer overflow: 4 byte write of buffer size 0
>>> [   80.842243] WARNING: CPU: 4 PID: 272 at lib/string_helpers.c:1032 __fortify_report+0x45/0x50
>>> ...
>>> [   80.843175]  __fortify_panic+0x9/0xb
>>> [   80.843186]  vsc_tp_xfer.cold+0x67/0x67 [mei_vsc_hw]
>>> [   80.843210]  ? seqcount_lockdep_reader_access.constprop.0+0x82/0x90
>>> [   80.843229]  ? lockdep_hardirqs_on+0x7c/0x110
>>> [   80.843250]  mei_vsc_hw_start+0x98/0x120 [mei_vsc]
>>> [   80.843270]  mei_reset+0x11d/0x420 [mei]
>>>
>>> The easiest fix would be to just drop the counted-by but with the exception
>>> of the ack buffer in vsc_tp_xfer_helper() which only contains enough room
>>> for the packet-header, all other uses of vsc_tp_packet always use a buffer
>>> of VSC_TP_MAX_XFER_SIZE bytes for the packet.
>>>
>>> Instead of just dropping the counted-by, split the vsc_tp_packet struct
>>> definition into a header and a full-packet definition and use a fixed
>>> size buf[] in the packet definition, this way fortify-source buffer
>>> overrun checking still works when enabled.
>>>
>>> Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
>>> Cc: stable@kernel.org
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>    drivers/misc/mei/vsc-tp.c | 26 +++++++++++++++-----------
>>>    1 file changed, 15 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
>>> index 7be1649b1972..fa553d4914b6 100644
>>> --- a/drivers/misc/mei/vsc-tp.c
>>> +++ b/drivers/misc/mei/vsc-tp.c
>>> @@ -36,20 +36,24 @@
>>>    #define VSC_TP_XFER_TIMEOUT_BYTES        700
>>>    #define VSC_TP_PACKET_PADDING_SIZE        1
>>>    #define VSC_TP_PACKET_SIZE(pkt) \
>>> -    (sizeof(struct vsc_tp_packet) + le16_to_cpu((pkt)->len) + VSC_TP_CRC_SIZE)
>>> +    (sizeof(struct vsc_tp_packet_hdr) + le16_to_cpu((pkt)->hdr.len) + VSC_TP_CRC_SIZE)
>>>    #define VSC_TP_MAX_PACKET_SIZE \
>>> -    (sizeof(struct vsc_tp_packet) + VSC_TP_MAX_MSG_SIZE + VSC_TP_CRC_SIZE)
>>> +    (sizeof(struct vsc_tp_packet_hdr) + VSC_TP_MAX_MSG_SIZE + VSC_TP_CRC_SIZE)
>>>    #define VSC_TP_MAX_XFER_SIZE \
>>>        (VSC_TP_MAX_PACKET_SIZE + VSC_TP_XFER_TIMEOUT_BYTES)
>>>    #define VSC_TP_NEXT_XFER_LEN(len, offset) \
>>> -    (len + sizeof(struct vsc_tp_packet) + VSC_TP_CRC_SIZE - offset + VSC_TP_PACKET_PADDING_SIZE)
>>> +    (len + sizeof(struct vsc_tp_packet_hdr) + VSC_TP_CRC_SIZE - offset + VSC_TP_PACKET_PADDING_SIZE)
>>>    -struct vsc_tp_packet {
>>> +struct vsc_tp_packet_hdr {
>>>        __u8 sync;
>>>        __u8 cmd;
>>>        __le16 len;
>>>        __le32 seq;
>>> -    __u8 buf[] __counted_by(len);
>>> +};
>>> +
>>> +struct vsc_tp_packet {
>>> +    struct vsc_tp_packet_hdr hdr;
>>> +    __u8 buf[VSC_TP_MAX_XFER_SIZE - sizeof(struct vsc_tp_packet_hdr)];
>>>    };
>>>      struct vsc_tp {
>>> @@ -158,12 +162,12 @@ static int vsc_tp_dev_xfer(struct vsc_tp *tp, void *obuf, void *ibuf, size_t len
>>>    static int vsc_tp_xfer_helper(struct vsc_tp *tp, struct vsc_tp_packet *pkt,
>>>                      void *ibuf, u16 ilen)
>>>    {
>>> -    int ret, offset = 0, cpy_len, src_len, dst_len = sizeof(struct vsc_tp_packet);
>>> +    int ret, offset = 0, cpy_len, src_len, dst_len = sizeof(struct vsc_tp_packet_hdr);
>>>        int next_xfer_len = VSC_TP_PACKET_SIZE(pkt) + VSC_TP_XFER_TIMEOUT_BYTES;
>>>        u8 *src, *crc_src, *rx_buf = tp->rx_buf;
>>>        int count_down = VSC_TP_MAX_XFER_COUNT;
>>>        u32 recv_crc = 0, crc = ~0;
>>> -    struct vsc_tp_packet ack;
>>> +    struct vsc_tp_packet_hdr ack;
>>>        u8 *dst = (u8 *)&ack;
>>>        bool synced = false;
>>>    @@ -280,10 +284,10 @@ int vsc_tp_xfer(struct vsc_tp *tp, u8 cmd, const void *obuf, size_t olen,
>>>          guard(mutex)(&tp->mutex);
>>>    -    pkt->sync = VSC_TP_PACKET_SYNC;
>>> -    pkt->cmd = cmd;
>>> -    pkt->len = cpu_to_le16(olen);
>>> -    pkt->seq = cpu_to_le32(++tp->seq);
>>> +    pkt->hdr.sync = VSC_TP_PACKET_SYNC;
>>> +    pkt->hdr.cmd = cmd;
>>> +    pkt->hdr.len = cpu_to_le16(olen);
>>> +    pkt->hdr.seq = cpu_to_le32(++tp->seq);
>>>        memcpy(pkt->buf, obuf, olen);
>>>          crc = ~crc32(~0, (u8 *)pkt, sizeof(pkt) + olen);
