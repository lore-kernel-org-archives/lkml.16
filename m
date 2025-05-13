Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B73928D840
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141835; cv=none; b=rQRaEPrWwqUCZ8r8gM9YHCc5AZ3cB3AQ5octEZ4pwJBdIpiurRGjKR2ZyXw9pUxhAPcAK8nXaPTHXJeOLSPUxzTV4rmTIVRs4SLsHhs9HT5GILju58AVkHsvCEp2Ji23BAUKZAmTR2+8ksKg78Dkg/u3wZyFtQ7by2oNkkvsj54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141835; c=relaxed/simple;
	bh=rHWIT4WYAwvHEbNedjEoJ9BtN9N8K0PIMLg+v+0K2M0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AvPOQK3YtC3cL1MSkh/oJZ9MPMMFr4k9toEjyu15JSanmq8sswztwvK98q3MmiC5DcuqXBqMF9hIRX1Kh4g28+s+GmMf6Cki0P2IUR/bAAtZU/tT+6bVUjE+NTOsoKemXLJk5piH2GA+owhtcd2ABgFXLIvsiimNQjCsVmXqsqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CjYClsyw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HqOyFuz1; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CjYClsyw; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=HqOyFuz1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CjYClsyw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HqOyFuz1";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CjYClsyw";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="HqOyFuz1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6C751211D1;
	Tue, 13 May 2025 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747141830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11tBS+jgpcKxdYTiqo2FzazKreTFp9sunKwlAVzvbHk=;
	b=CjYClsywKLaDBM62r83pYPtQ9vRn9P2askBSq/j8TyTAIZDHSXgV+f0DN38jIhrg5WZLi7
	+oco2iO79P4l37FveGiO6fE7GSHN8IDPd+bgwmk0j3SbjOi1gRWz04FikRuVbB9l+X+dVm
	gSLtX4qUegfnrS81k6jhYOfoitvuYFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747141830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11tBS+jgpcKxdYTiqo2FzazKreTFp9sunKwlAVzvbHk=;
	b=HqOyFuz16rB3ZSwvQ8tMS0i3rcKt/ldfHhkXsBycV26U6/l0QZlQpUiu2aV/DhShMipAQL
	jUiD41h0VPmhcpBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1747141830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11tBS+jgpcKxdYTiqo2FzazKreTFp9sunKwlAVzvbHk=;
	b=CjYClsywKLaDBM62r83pYPtQ9vRn9P2askBSq/j8TyTAIZDHSXgV+f0DN38jIhrg5WZLi7
	+oco2iO79P4l37FveGiO6fE7GSHN8IDPd+bgwmk0j3SbjOi1gRWz04FikRuVbB9l+X+dVm
	gSLtX4qUegfnrS81k6jhYOfoitvuYFI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1747141830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=11tBS+jgpcKxdYTiqo2FzazKreTFp9sunKwlAVzvbHk=;
	b=HqOyFuz16rB3ZSwvQ8tMS0i3rcKt/ldfHhkXsBycV26U6/l0QZlQpUiu2aV/DhShMipAQL
	jUiD41h0VPmhcpBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 368FC137E8;
	Tue, 13 May 2025 13:10:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2kzNDMZEI2jLVAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 13 May 2025 13:10:30 +0000
Message-ID: <15a8e990-4eb0-489f-bf2f-a192e4fe9543@suse.cz>
Date: Tue, 13 May 2025 15:10:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/7] memcg: no stock lock for cpu hot-unplug
Content-Language: en-US
To: Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Alexei Starovoitov <ast@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Harry Yoo <harry.yoo@oracle.com>, Yosry Ahmed <yosry.ahmed@linux.dev>,
 bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
References: <20250513031316.2147548-1-shakeel.butt@linux.dev>
 <20250513031316.2147548-8-shakeel.butt@linux.dev>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250513031316.2147548-8-shakeel.butt@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,suse.cz:mid,suse.cz:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30

On 5/13/25 05:13, Shakeel Butt wrote:
> Previously on the cpu hot-unplug, the kernel would call
> drain_obj_stock() with objcg local lock. However local lock was not
> neede as the stock which was accessed belongs to a dead cpu but we kept

needed

> it there to disable irqs as drain_obj_stock() may call
> mod_objcg_mlstate() which required irqs disabled. However there is no
> need to disable irqs now for mod_objcg_mlstate(), so we can remove the
> lcoal lock altogether from cpu hot-unplug path.

local

> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

I think you could switch ordering of this patch with 6/7 to avoid changing
memcg_hotplug_cpu_dead() twice?

Acked-by: Vlastimil Babka <vbabka@suse.cz>

