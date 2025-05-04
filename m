Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E028518C322
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746349015; cv=none; b=VQ2kzrNvRBUg2ufvO+CdJfJXzkdFW5bk15Hm5aqiUCu0eP59e3fSlL79B8LUO0zyQTi7eRHH2dCw1nMss4wIFPyogsNJPog4Jz2JlXjWg1qYHshVOZUL99zhMUGtPlmz0eJ/ny9yCRiDFnBURbSxwjI8oaHvvGk6Mc6kWrm5opY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746349015; c=relaxed/simple;
	bh=2n4qaHdYTSYf4qj296nUqLp383YIRyNFlFgHx3VyWGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=af8xATUULjKLWiIfCfw8ldv0bX+askUoXermK8FXcjxGWa5SgTayMbD66GDa/bi0yTbha/QykOfIe+21t92K7YfZJe0CmuJ/8M4BziP4eavJ3VF941sMJpcYuc30mmiCZNrgRIU1i2z2iPQuvUFgzIEmJcKmr4QpGDU1sUTjZms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O1l7m5DJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O1l7m5DJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746349011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xlslNoMBCGaekDVKMFQMnz66orhgHjvJF/zGx7xhkSE=;
	b=O1l7m5DJSqXBtHlIuXq2CSVXbHy8Jj0a1/qdLz2LUFWhfSuq12RqJxoun3ntl3CaqhNaVc
	9EZGsBFP5bNolGlClzPPaoY1nKgjhrOR6ToRjfJaQub7hAxqMDuB9K1cHgbkpwmBfO2QiQ
	cz5d1Vf8zvkrK66l9ik3wA45EQopSYc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-W3cGlrB6OTqruOlWscJijQ-1; Sun, 04 May 2025 04:56:50 -0400
X-MC-Unique: W3cGlrB6OTqruOlWscJijQ-1
X-Mimecast-MFC-AGG-ID: W3cGlrB6OTqruOlWscJijQ_1746349009
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5faf81be33cso257899a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 01:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746349009; x=1746953809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xlslNoMBCGaekDVKMFQMnz66orhgHjvJF/zGx7xhkSE=;
        b=iTyk5VOqRhEVynjrqB1P66nKFWxMiBDydJsmHo8QILhatzprnKTj9iQ4uyh0i4vilk
         2YaBYqBbPranCpf+R0cLJ7RGKabvtFNfMlTpEk9v052D6Yjja60tv/TOQHy/Pou1FyXQ
         3Zg5RUhuW9R5shFB+euPRkXZ4x8JJBpZnm/kyYfmkNlJuOxF4hZFrSs/6FtwQErJ50h3
         qMJYFlQyDZcIFEBtZCe42GvXYje2h5ssbjaop+/yJJieCXlCCnOdbG6fCwYSTM9xUFxr
         TvF2NYBVXg7jhutK8zMjLNZQl65u+q4COpIZoERfKTvYRUMbeahmiLYhIE5kCBHHUJII
         bjpg==
X-Forwarded-Encrypted: i=1; AJvYcCXkPcAASOU+Gv690tYdE0ifzJ13YYhvr+vciS6IGpgBeT2o//QM3wvU/B8gHx2WHceuHIb7fJXwUCjCSwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwrAHSVHtYOjHRQaRkdTsROY+hy9dyI+8iRbEvHKblP0Ix6OOK
	pexH/LhnSs/IxWmk9T/4hh1rNu+n6rFuaSYkA+3+Hrc6WSitgqW6sZz+R72NUUdDDR3+XQYNra9
	3+XMEOaC3zeIZLhmPNP0CMR+O7ZrpWLxmjzFFCKiK/aUIlpR1LZ9XjPj2iy02VA==
X-Gm-Gg: ASbGncug2pZ0rk5xC1UlI8GSjhpeWVXjPm5IDldqz0diU4txZe99TfU/Jmucs0Mz5pB
	3XPHN79g5Wy4CliZ9BRe77zTYEqeC2uz2Fd6nkFjHLDI/uK0QVb2moDhikzeJlrNFCEWxYBR06s
	NA6cbkpfouGy1XojasjfbkuhZwqLymeMUvzFSO2v6DvmfrFl91AysCY/QAX8akb6LMHGS4UebUp
	YunCQsLAOfvalJn+LjLW4uoLV/DApecB/AH1vU128pkgebHs2AicKRSYUjaKMQH6k0/WQY03ORJ
	VEAWcK5wG6rhaWwv4TqGoY6tpxhns+smRa1X2TVrqXPph/OBh1qydTad3rbi0HT2dAbYgzZf/IX
	Bo1w1psfDEX5N+ejL/tbeYq3s+5AA37m6/8WtkK9xmlfqrw14CbvdwMvYRkSdww==
X-Received: by 2002:a05:6402:3595:b0:5f8:3b33:f838 with SMTP id 4fb4d7f45d1cf-5faa767ba97mr3739992a12.0.1746349009123;
        Sun, 04 May 2025 01:56:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnZyc1jV0kadOH+hOE8Ox6smjpyNfE5YwP0WrC/3SX/3skXXf3Ml+kfnBGJSgFizGn4zxGWw==
X-Received: by 2002:a05:6402:3595:b0:5f8:3b33:f838 with SMTP id 4fb4d7f45d1cf-5faa767ba97mr3739986a12.0.1746349008727;
        Sun, 04 May 2025 01:56:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8bbesm3809068a12.22.2025.05.04.01.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 01:56:47 -0700 (PDT)
Message-ID: <0f838e71-429c-4029-8aba-f6389f6bba7d@redhat.com>
Date: Sun, 4 May 2025 10:56:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mei: vsc: Fix fortify-panic caused by invalid
 counted_by() use
To: Mateusz Schyboll <dragonn@op.pl>, Wentong Wu <wentong.wu@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250318141203.94342-1-hdegoede@redhat.com>
 <20250318141203.94342-2-hdegoede@redhat.com>
 <4db60fd6-ffd7-43d8-967b-38d6dae5be71@op.pl>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4db60fd6-ffd7-43d8-967b-38d6dae5be71@op.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mateusz,

On 4-May-25 10:25 AM, Mateusz Schyboll wrote:
> Hi,
> 
> found this patch while searching for a I think a similar bug on 6.14.4 compiled with gcc 15:
> 
> [  121.966267] memcpy: detected buffer overflow: 3 byte read of buffer size 18446744073709551615

<snip.

> [  121.966409] Call Trace:
> [  121.966411]  <TASK>
> [  121.966412]  __fortify_panic+0xd/0xf
> [  121.966416]  bch2_xattr_get_trans.cold+0xe/0xe [bcachefs b5391e24358551d6754989dda9ec90add2ece543]

<snip>

> Unfortunately even with this patch the bug still shows up, so I am not 100% sure this is exactly the same , the call trace is diffirent so maybe a similar bug but in a diffirent subsystem?

That is not surprising, this really is a totally different bug,
which happens to also trigger a fortify panic and that you're seeing
this bug now that arch has switched to gcc15 indicates that it indeed
is triggered by gcc15 now supporting counted_by().

This could either be a real bug in the kernel which now gets caught or
another invalid counted_by() use.

Either way looking at the back trace it seems that you are using
bcachefs and this is a bcache fs issue (bch2_xattr_get_trans()
is defined in fs/bcachefs/xattr.c).

Please report this to the bcachefs developer. Note it would be
good to note in your report to Kent that this is triggered by gcc15.

Regards,

Hans





> The behavior from user space is that I am trying to launch Tiny Tina's Wonderlands and that pops up after the optimizing shaders finishes and the game never launches, it gets stuck after that.
> 
> W dniu 18.03.2025 o 15:12, Hans de Goede pisze:
>> gcc 15 honors the __counted_by(len) attribute on vsc_tp_packet.buf[]
>> and the vsc-tp.c code is using this in a wrong way. len does not contain
>> the available size in the buffer, it contains the actual packet length
>> *without* the crc. So as soon as vsc_tp_xfer() tries to add the crc to
>> buf[] the fortify-panic handler gets triggered:
>>
>> [   80.842193] memcpy: detected buffer overflow: 4 byte write of buffer size 0
>> [   80.842243] WARNING: CPU: 4 PID: 272 at lib/string_helpers.c:1032 __fortify_report+0x45/0x50
>> ...
>> [   80.843175]  __fortify_panic+0x9/0xb
>> [   80.843186]  vsc_tp_xfer.cold+0x67/0x67 [mei_vsc_hw]
>> [   80.843210]  ? seqcount_lockdep_reader_access.constprop.0+0x82/0x90
>> [   80.843229]  ? lockdep_hardirqs_on+0x7c/0x110
>> [   80.843250]  mei_vsc_hw_start+0x98/0x120 [mei_vsc]
>> [   80.843270]  mei_reset+0x11d/0x420 [mei]
>>
>> The easiest fix would be to just drop the counted-by but with the exception
>> of the ack buffer in vsc_tp_xfer_helper() which only contains enough room
>> for the packet-header, all other uses of vsc_tp_packet always use a buffer
>> of VSC_TP_MAX_XFER_SIZE bytes for the packet.
>>
>> Instead of just dropping the counted-by, split the vsc_tp_packet struct
>> definition into a header and a full-packet definition and use a fixed
>> size buf[] in the packet definition, this way fortify-source buffer
>> overrun checking still works when enabled.
>>
>> Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
>> Cc: stable@kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/misc/mei/vsc-tp.c | 26 +++++++++++++++-----------
>>   1 file changed, 15 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
>> index 7be1649b1972..fa553d4914b6 100644
>> --- a/drivers/misc/mei/vsc-tp.c
>> +++ b/drivers/misc/mei/vsc-tp.c
>> @@ -36,20 +36,24 @@
>>   #define VSC_TP_XFER_TIMEOUT_BYTES        700
>>   #define VSC_TP_PACKET_PADDING_SIZE        1
>>   #define VSC_TP_PACKET_SIZE(pkt) \
>> -    (sizeof(struct vsc_tp_packet) + le16_to_cpu((pkt)->len) + VSC_TP_CRC_SIZE)
>> +    (sizeof(struct vsc_tp_packet_hdr) + le16_to_cpu((pkt)->hdr.len) + VSC_TP_CRC_SIZE)
>>   #define VSC_TP_MAX_PACKET_SIZE \
>> -    (sizeof(struct vsc_tp_packet) + VSC_TP_MAX_MSG_SIZE + VSC_TP_CRC_SIZE)
>> +    (sizeof(struct vsc_tp_packet_hdr) + VSC_TP_MAX_MSG_SIZE + VSC_TP_CRC_SIZE)
>>   #define VSC_TP_MAX_XFER_SIZE \
>>       (VSC_TP_MAX_PACKET_SIZE + VSC_TP_XFER_TIMEOUT_BYTES)
>>   #define VSC_TP_NEXT_XFER_LEN(len, offset) \
>> -    (len + sizeof(struct vsc_tp_packet) + VSC_TP_CRC_SIZE - offset + VSC_TP_PACKET_PADDING_SIZE)
>> +    (len + sizeof(struct vsc_tp_packet_hdr) + VSC_TP_CRC_SIZE - offset + VSC_TP_PACKET_PADDING_SIZE)
>>   -struct vsc_tp_packet {
>> +struct vsc_tp_packet_hdr {
>>       __u8 sync;
>>       __u8 cmd;
>>       __le16 len;
>>       __le32 seq;
>> -    __u8 buf[] __counted_by(len);
>> +};
>> +
>> +struct vsc_tp_packet {
>> +    struct vsc_tp_packet_hdr hdr;
>> +    __u8 buf[VSC_TP_MAX_XFER_SIZE - sizeof(struct vsc_tp_packet_hdr)];
>>   };
>>     struct vsc_tp {
>> @@ -158,12 +162,12 @@ static int vsc_tp_dev_xfer(struct vsc_tp *tp, void *obuf, void *ibuf, size_t len
>>   static int vsc_tp_xfer_helper(struct vsc_tp *tp, struct vsc_tp_packet *pkt,
>>                     void *ibuf, u16 ilen)
>>   {
>> -    int ret, offset = 0, cpy_len, src_len, dst_len = sizeof(struct vsc_tp_packet);
>> +    int ret, offset = 0, cpy_len, src_len, dst_len = sizeof(struct vsc_tp_packet_hdr);
>>       int next_xfer_len = VSC_TP_PACKET_SIZE(pkt) + VSC_TP_XFER_TIMEOUT_BYTES;
>>       u8 *src, *crc_src, *rx_buf = tp->rx_buf;
>>       int count_down = VSC_TP_MAX_XFER_COUNT;
>>       u32 recv_crc = 0, crc = ~0;
>> -    struct vsc_tp_packet ack;
>> +    struct vsc_tp_packet_hdr ack;
>>       u8 *dst = (u8 *)&ack;
>>       bool synced = false;
>>   @@ -280,10 +284,10 @@ int vsc_tp_xfer(struct vsc_tp *tp, u8 cmd, const void *obuf, size_t olen,
>>         guard(mutex)(&tp->mutex);
>>   -    pkt->sync = VSC_TP_PACKET_SYNC;
>> -    pkt->cmd = cmd;
>> -    pkt->len = cpu_to_le16(olen);
>> -    pkt->seq = cpu_to_le32(++tp->seq);
>> +    pkt->hdr.sync = VSC_TP_PACKET_SYNC;
>> +    pkt->hdr.cmd = cmd;
>> +    pkt->hdr.len = cpu_to_le16(olen);
>> +    pkt->hdr.seq = cpu_to_le32(++tp->seq);
>>       memcpy(pkt->buf, obuf, olen);
>>         crc = ~crc32(~0, (u8 *)pkt, sizeof(pkt) + olen);
> 

