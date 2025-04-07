Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680D22CBFE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068953; cv=none; b=hIEGqaSCFHHkbhAstVU4kkCyIGmGfF9bexrGNIY8YmwSZoeSHGG0pvxyn+NoXeq8D/01YSzYUc0INl/uM8zMx5tNTarXBREPtxasUyibpBwUMEZXaeQj558dNbmAzFTrt1VLhcKalIpU+4R9AUtYMHjveunH1AoXXQykQhM22pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068953; c=relaxed/simple;
	bh=nkroRZIsUPXnHwLiwTtvmSFph4NxNdnTJLh59C9Z0D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UcPN2DAAPShJrS0duU0BOCEm+Bq7A2vfJdopRJoX1OGu0vNAA9KUprnrrW1EHRGWmK/94V0d82TS2I+4why/tLilPloDby/H3xEpO5oR57IJvyfRDAGM+BzPj4+p7XZGsdMkfI5AGgnxht9ExFPegiR3QePTBsb6SM4PI9bzvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=asNUF5Z2; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="asNUF5Z2"
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id 1scCu2O73f1UX1w0Mus0aP; Mon, 07 Apr 2025 23:35:50 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 1w0MucNlJRlrs1w0Muw6Jg; Mon, 07 Apr 2025 23:35:50 +0000
X-Authority-Analysis: v=2.4 cv=Qamtvdbv c=1 sm=1 tr=0 ts=67f46156
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10
 a=4V2JOyclYXKWiCCFizwA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=97bElyQUpdy5ltz54fpnmGgcyORr0BUbRtAfywk6zQM=; b=asNUF5Z2It4rsXVDS9wI3cyuFL
	z5dmJT/VdtmEhWWqBsDWUHvckt/9PYfls8I6NdI6ZKRNQW05zzS8h1Lovv0rIo/ZibKl9kA4RK+Nk
	S/W5Ama6lE326TKtAlQiIXWHRvl4TX06hmfCHUlPvEg8sDryjz9PhzsUc9Jvj38lkJuv6Ae8EIOte
	9Ubg56Q+Hkj2AMXcDiRl0uSXQE6My8WhhrKnCr0ED2T0uFPfG1+KXQTGknyIT8xvX9kvrz96nzCOt
	/4K3tTTdjqrHxuqosXCKrs3O9bQHemWcYCqLkJ+h+gmNaGYg0z0Jo33Uo2cn1GXVaAgDNrHWg2q55
	QjuSa8Og==;
Received: from [201.172.174.147] (port=49836 helo=[192.168.15.6])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1u1w0L-00000000auU-0VGL;
	Mon, 07 Apr 2025 18:35:49 -0500
Message-ID: <a6dccb66-3f97-443f-85e5-fe089cd93a5e@embeddedor.com>
Date: Mon, 7 Apr 2025 17:35:47 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau: chan: Avoid
 -Wflex-array-member-not-at-end warnings
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z-67Hm9uHEJs0RGw@kspp> <202504071227.E8484EB@keescook>
 <d8e63b8a-7a2c-46dc-a15c-9399044a23ee@embeddedor.com>
 <202504071336.0C708FCAB8@keescook>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <202504071336.0C708FCAB8@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1u1w0L-00000000auU-0VGL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.6]) [201.172.174.147]:49836
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAjVnbkAeM9/9JsZcqoW5tv+QBLrMIUeuwb6N3FGEm/QCLrTde1wGXHd04qdLYENPqG9VPx+0/qTKssCJhJxgB5qOdzZstmtUoKaP+y9TT1vHhzDkUV+
 /fPOT/3cAUFlz+/s3qKoxD2fQ6noFb8Zk8l4XQ09KlhQUneDNj05KtXVZGshDlPe9exRe7G9kbPnDakiHFmRzY5z1JcYtRXQ7iE6mykUlYDia1I62RFC1Ja+

[..]

>>>> -	struct {
>>>> -		struct nvif_chan_v0 chan;
>>>> -		char name[TASK_COMM_LEN+16];
>>>> -	} args;
>>>> +	DEFINE_RAW_FLEX(struct nvif_chan_v0, args, name, TASK_COMM_LEN + 16);
>>>>    	struct nvif_device *device = &cli->device;
>>>>    	struct nouveau_channel *chan;
>>>>    	const u64 plength = 0x10000;
>>>> @@ -298,28 +295,28 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
>>>>    		return ret;
>>>>    	/* create channel object */
>>>> -	args.chan.version = 0;
>>>> -	args.chan.namelen = sizeof(args.name);
>>>> -	args.chan.runlist = __ffs64(runm);
>>>> -	args.chan.runq = 0;
>>>> -	args.chan.priv = priv;
>>>> -	args.chan.devm = BIT(0);
>>>> +	args->version = 0;
>>>> +	args->namelen = __struct_size(args) - sizeof(*args);
>>>
>>> Does __struct_size(args->name) work here (and later)?
>>
>> Why not?
> 
> Uhm, I'm genuinely curious. I *think* it will work, but because it's
> within the struct, not outside of it, I'm unclear if it'll DTRT for
> finding the size (since __builtin_object_size() can be touchy).
> 
>> I mean, this should be equivalent to `TASK_COMM_LEN+16`, I could
>> use the latter if people prefer it (see my comments below).
> 
> Right, it should be the same. I think __struct_size(args->name) would be
> much more readable ... if it works. :)

OK, I'll double check this.

[..]

>>>> @@ -367,17 +365,17 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
>>>>    		return ret;
>>>>    	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
>>>> -		struct {
>>>> -			struct nvif_event_v0 base;
>>>> -			struct nvif_chan_event_v0 host;
>>>> -		} args;
>>>> +		DEFINE_RAW_FLEX(struct nvif_event_v0, args, data,
>>>> +				sizeof(struct nvif_chan_event_v0));
>>>> +		struct nvif_chan_event_v0 *host =
>>>> +				(struct nvif_chan_event_v0 *)args->data;
>>>> -		args.host.version = 0;
>>>> -		args.host.type = NVIF_CHAN_EVENT_V0_KILLED;
>>>> +		host->version = 0;
>>>> +		host->type = NVIF_CHAN_EVENT_V0_KILLED;
>>>>    		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
>>>>    				      nouveau_channel_killed, false,
>>>> -				      &args.base, sizeof(args), &chan->kill);
>>>> +				      args, __struct_size(args), &chan->kill);
>>>>    		if (ret == 0)
>>>>    			ret = nvif_event_allow(&chan->kill);
>>>>    		if (ret) {
>>>> @@ -520,46 +518,45 @@ nouveau_channels_fini(struct nouveau_drm *drm)
>>>>    int
>>>>    nouveau_channels_init(struct nouveau_drm *drm)
>>>>    {
>>>> -	struct {
>>>> -		struct nv_device_info_v1 m;
>>>> -		struct {
>>>> -			struct nv_device_info_v1_data channels;
>>>> -			struct nv_device_info_v1_data runlists;
>>>> -		} v;
>>>> -	} args = {
>>>> -		.m.version = 1,
>>>> -		.m.count = sizeof(args.v) / sizeof(args.v.channels),
>>>
>>> sizeof(args.v) == sizeof(struct nv_device_info_v1_data) * 2
>>>
>>> and sizeof(args.v.channels) == sizeof(struct nv_device_info_v1_data).
>>>
>>> Isn't this just "2"? i.e. isn't struct nv_device_info_v1::count the
>>> counted_by for struct nv_device_info_v1::data?
>>
>> Yes, it's just `2`. However, I didn't want to explicitly use the magic
>> number, in case people don't like it, as in other similar patches (in
>> other subsystems).
>>
>> But, yeah, it's `2`. :)
> 
> Okay. So if "count" is set up as a counted_by, the assignment will
> happen automatically (in DEFINE_FLEX -- no longer "RAW").

I really don't want to condition -Wflex-array-member-not-at-end patches
on counted_by patches, for now.

Thanks
--
Gustavo
