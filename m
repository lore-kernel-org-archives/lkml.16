Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9161D95A9
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738567213; cv=none; b=h6/zXkICpuCA7PjvRRx12ZVCeLIMpnoaREMrijav3/hTftFgkeK5vmZunbxuj9vJuJFtSyj5gEYifWNA7Wnhcovz69qUKlQV0FtOqj/77sZdqbCurg6MGRZYoWlY+EVXIjUeLJ2ePtbsTkgtxIFU75jGEb2hmEBVFIHs3Od7s8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738567213; c=relaxed/simple;
	bh=RNYSgpJUiPLMwJd50q7KPm9JxHNGpdjQ76WE3ybbQR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8WVJcMUL6zifJa+AiVaB3B75wr+vBDZ8EYsdbjkiQxA/d+wSHqtRx1BsT2n88sXD8wg6WSanzQxd5qUjezwYs/hrTUp1h0XbXtjLMdAK23rP+puMNOnYLHPpnyIVn31p7EUSd8Y7dvhT4hl/xd/GRhXclfidd0Q3kwubKxR918=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b+e1v8Kx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rTkob0eR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nbz5fZuZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SeYm/L1Z; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b+e1v8Kx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rTkob0eR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nbz5fZuZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SeYm/L1Z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2D15210F8;
	Mon,  3 Feb 2025 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738567209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdfqbad1okBis4E+HronChbubnNuCzXDyRer0itrCU=;
	b=b+e1v8KxiwC6as9hteMUVLmq3A0ofKX1wIsYYOlO8Qp7UM8vkTpfucvmzVioHdSww2dc7q
	1MFty6d1KW1OUJ9PGctMSKncgOck2SbfrMY2exvaV1Tk+MmC5J/WBdzv3lyRgaZyATcExm
	H34q2Cew7UJJU92/gRt/0nmkDMU1ISI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738567209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdfqbad1okBis4E+HronChbubnNuCzXDyRer0itrCU=;
	b=rTkob0eRP2VkEO8U5XTQqPynMUQ7zi2z8bLBoBG5TNtYC7Ziyhae/e4zrqsZltpEfIM7H3
	C88mMBMVFR9xKIAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Nbz5fZuZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="SeYm/L1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738567208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdfqbad1okBis4E+HronChbubnNuCzXDyRer0itrCU=;
	b=Nbz5fZuZVnaxgMnMgdWUrTBLiGQkhUN96WlzrzC3fz9Ya6A8hjXSiT7p0uOZnBKJoDL6HN
	cUgtxM9la+5HbH9QiSKAIlqGvSOFDXPznRHjWhzKtUeFXBlV/pB/MomA5TbCb5EpMNUKG4
	8J9hRA/JbHoYYiSjMhtjNwt2AsFiL5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738567208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jXdfqbad1okBis4E+HronChbubnNuCzXDyRer0itrCU=;
	b=SeYm/L1ZC+9Pah9PutCjPJ5oiwy6Hx9WRKfG5cjjoMUu+f0QYD83iO5E+j6l/VEmZv4cC6
	v7B2H6mSy0UWliDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77C5913795;
	Mon,  3 Feb 2025 07:20:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3VNKGyhuoGdWOAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 03 Feb 2025 07:20:08 +0000
Message-ID: <17d0b30a-758c-4a84-9879-0a070656f15e@suse.de>
Date: Mon, 3 Feb 2025 08:20:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] nvme-tcp: fix connect failure on receiving partial
 ICResp PDU
To: Caleb Sander <csander@purestorage.com>, Sagi Grimberg <sagi@grimberg.me>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Maurizio Lombardi <mlombard@redhat.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250124184311.1642797-1-csander@purestorage.com>
 <9ea74200-7cbc-4a30-9503-864dcec9b45d@suse.de>
 <CADUfDZoT7JW+d+j6YNmWJ3CKZ45gbvcUSsE6boZwE1C3iXw2_g@mail.gmail.com>
 <f75c62ce-04a7-4bc0-ae77-8ed80842bf37@suse.de>
 <CADUfDZrvHmYQgqu5GiQDrAg_MOEiRigCLCmBSO6jeyd1z+Q-JQ@mail.gmail.com>
 <3bcc6e3f-5172-40d4-a4d4-b0f914b9406b@grimberg.me>
 <CADUfDZq3ZqpP9hZhgG1gzyyggG6SCQiHqHdgbm95TU2oZ5QFUQ@mail.gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <CADUfDZq3ZqpP9hZhgG1gzyyggG6SCQiHqHdgbm95TU2oZ5QFUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C2D15210F8
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On 2/3/25 01:19, Caleb Sander wrote:
> On Fri, Jan 31, 2025 at 12:17 AM Sagi Grimberg <sagi@grimberg.me> wrote:
> ...
>> Caleb, can you please make sure to test this patch with TLS?
> 
> Can you point me to some documentation for that? I tried setting up a
> nvmet_tcp port to use TLS and connecting to it as described in the
> cover letter for the patch series (https://lwn.net/Articles/941139/).
> But the TLS Server Hello seems to fail with EACCES. Any idea what I'm
> doing wrong?
> $ modprobe nvmet_tcp
> $ modprobe null_blk nr_devices=1
> $ mkdir /sys/kernel/config/nvmet/subsystems/nqn.nvmet
> $ echo 1 > /sys/kernel/config/nvmet/subsystems/nqn.nvmet/attr_allow_any_host
> $ mkdir /sys/kernel/config/nvmet/subsystems/nqn.nvmet/namespaces/1
> $ echo /dev/nullb0 >
> /sys/kernel/config/nvmet/subsystems/nqn.nvmet/namespaces/1/device_path
> $ echo 1 > /sys/kernel/config/nvmet/subsystems/nqn.nvmet/namespaces/1/enable
> $ mkdir /sys/kernel/config/nvmet/ports/1
> $ echo tcp > /sys/kernel/config/nvmet/ports/1/addr_trtype
> $ echo ipv4 > /sys/kernel/config/nvmet/ports/1/addr_adrfam
> $ echo 127.0.0.1 > /sys/kernel/config/nvmet/ports/1/addr_traddr
> $ echo 4420 > /sys/kernel/config/nvmet/ports/1/addr_trsvcid
> $ echo required > /sys/kernel/config/nvmet/ports/1/addr_treq
> $ echo tls1.3 > /sys/kernel/config/nvmet/ports/1/addr_tsas
> $ ln -s /sys/kernel/config/nvmet/subsystems/nqn.nvmet
> /sys/kernel/config/nvmet/ports/1/subsystems
> $ nvme gen-tls-key --subsysnqn nqn.nvmet --insert
> Inserted TLS key 005e8a74
> $ nvme gen-tls-key --subsysnqn nqn.2014-08.org.nvmexpress.discovery --insert
> Inserted TLS key 22d676b8
> $ tlshd &
> $ nvme discover --transport tcp --traddr 127.0.0.1 --trsvcid 4420 --tls
> Failed to write to /dev/nvme-fabrics: Input/output error
> failed to add controller, error failed to write to nvme-fabrics device
> 
> With debug logs enabled, I see the following:
> $ dmesg | tail -6
> [  440.405298] nvme nvme0: connecting queue 0
> [  440.405403] nvmet_tcp: queue 0: TLS ServerHello
> [  440.405433] nvme nvme0: queue 0: start TLS with key 11b456f9
> [  440.407836] nvmet_tcp: queue 0: TLS handshake done, key 0, status -13
> [  440.422881] nvme nvme0: queue 0: TLS handshake done, key 0, status -13
> [  440.422932] nvme nvme0: queue 0: TLS handshake complete, error 13
> 
> A tcpdump shows the host sending a TLS Client Hello packet and the
> target immediately closing the connection.
> 

The PSK identification has to contain the host NQN _and_ the target NQN.
So you need to call gen-tls-key with both in order to generate a PSK
with an identitify which can be found for a connection attempt.

>> Do you have a reliable way to reproduce this?
> 
> Sure, here's a fake Python NVMe/TCP controller that immediately closes
> each connection after receiving the ICReq PDU:
> ```
> import socket
> 
> def recv_all(socket, length):
>      result = b''
>      while len(result) < length:
>          result += socket.recv(length - len(result))
>      return result
> 
> listen_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> listen_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> listen_sock.bind(('', 4420))
> listen_sock.listen()
> while True:
>      client_sock, _ = listen_sock.accept()
>      recv_all(client_sock, 128) # ICReq
>      client_sock.close()
> ```
> Attempting to connect to it reports an error about the ICResp PDU type
> field even though no ICResp was sent:
> $ nvme connect --transport tcp --traddr 192.168.1.12 --nqn nqn.abc
> Failed to write to /dev/nvme-fabrics: Invalid argument
> could not add new controller: invalid arguments/configuration
> $ dmesg | tail -1
> [1351639.614853] nvme_tcp: queue 0: bad type returned 0
> 
> Here's a valid scenario where the controller sends the ICResp Common
> Header and PDU Specific Header separately (using TCP_NODELAY to ensure
> the sends are not coalesced):
> ```
> import socket
> 
> def recv_all(socket, length):
>      result = b''
>      while len(result) < length:
>          result += socket.recv(length - len(result))
>      return result
> 
> def send_all(socket, data):
>      while data:
>          data = data[socket.send(data):]
> 
> listen_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> listen_sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> listen_sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
> listen_sock.bind(('', 4420))
> listen_sock.listen()
> while True:
>      client_sock, _ = listen_sock.accept()
>      recv_all(client_sock, 128) # ICReq
>      common_header = bytes([
>          0x01, # PDU-type
>          0, # FLAGS
>          128, # HLEN
>          0, # PDO
>          128, 0, 0, 0, # PLEN
>      ])
>      send_all(client_sock, common_header)
>      ic_resp = bytes([
>          0, 0, # PFV
>          0, # CPDA
>          0, # DGST
>          0xFC, 0xFF, 0xFF, 0xFF, # MAXH2CDATA
>      ] + [0] * 112)
>      send_all(client_sock, ic_resp)
>      client_sock.close()
> ```
> The host refuses to connect, complaining that the MAXH2CDATA field in
> the ICResp is invalid. But that is because it only received the Common
> Header.
> $ nvme connect --transport tcp --traddr 192.168.1.12 --nqn nqn.abc
> Failed to write to /dev/nvme-fabrics: Invalid argument
> could not add new controller: invalid arguments/configuration
> $ dmesg | tail -1
> [1351960.082011] nvme_tcp: queue 0: invalid maxh2cdata returned 0
> 
> With the patch applied, the controller closing the connection without
> sending a ICResp PDU correctly results in a "Connection reset by peer"
> error:
> $ nvme connect --transport tcp --traddr 192.168.2343.066666666671.12 --nqn nqn.abc
> Failed to write to /dev/nvme-fabrics: Connection reset by peer
> could not add new controller: failed to write to nvme-fabrics device
> $ dmesg | tail -1
> [  450.050463] nvme_tcp: queue 0: failed to receive icresp, error 0
> 
> And when the controller sends the Common Header separately from the
> PDU Specific Header, nvme_tcp_init_connection() now succeeds. The
> connection attempt instead times out waiting for a response to the
> Fabrics Connect command, since the fake NVMe/TCP controller doesn't
> implement that:
> $ nvme connect --transport tcp --traddr 192.168.1.12 --nqn nqn.abc
> Failed to write to /dev/nvme-fabrics: Input/output error
> could not add new controller: failed to write to nvme-fabrics device
> $ dmesg | tail -3
> [  644.728894] nvme nvme0: I/O tag 0 (0000) type 4 opcode 0x7f
> (Connect) QID 0 timeout
> [  644.728974] nvme nvme0: Connect command failed, error wo/DNR bit: 881
> [  644.728999] nvme nvme0: failed to connect queue: 0 ret=881
> 
Thanks.

I'll see to give it a spin.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
