Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92293134BD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743281181; cv=none; b=N0HpryCXNTBX8JalkIZnQQWIZKTWywav+AhdYbm1fZJAm/C3eFm85P6eS/Bah+uDvW+SDjhINXUTvQbacI1fb5TxUGbmmS2KY6jkHA/FpVemsGc03Sqpc6Vtt86Oyp1gC7ZlBY1a/B8R5y3l+Oa0fjV9rG/6qiZurpUmss9ceu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743281181; c=relaxed/simple;
	bh=PaGInjLd+F9Xlo3n31CthALA/UVyZKBXyLlU4Gm+1G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aw+WNTgm9nX+PfsBmC9oO3fR6UIuOOxDVpjJsJ3hQL8cuku7Q9TjKNhHO8KgUzdrp8tXE8tvzev59gwT0+ht2x9+5NfFz5Qv4TWznYLc/z8S6tTJPzudxVXooITv1L26zX5MrYygyXqPdb3caoESuTD1Sy1QPAVT7d8OVxR7wPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=QctUuKaV; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=nb53oWEx; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AzsoyU1I; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=21Tiz7UC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="QctUuKaV";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="nb53oWEx";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AzsoyU1I";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="21Tiz7UC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9FA201F38D;
	Sat, 29 Mar 2025 20:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743281171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gepOCVX71QnP7L//Gv8XkzdYtxTZGoyPpdEBdx/FukU=;
	b=QctUuKaVn8ExoqKkdZ+kfDf8Xv7dgp5C40RFtj3YR7sLdWmPFeefxO6k2bEhGohsrR1MbP
	NVAIaqbw+TomaO/HQS2IL0BxymC30dUqqgoSF3GBzesTBCnH8O09Dc2Uzw3kUjQVPoEJzs
	bx+QddGJsRvUIwQeTpWcgXO2vhXYPk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743281171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gepOCVX71QnP7L//Gv8XkzdYtxTZGoyPpdEBdx/FukU=;
	b=nb53oWExfZW7WXUB8+iRAAtqawefIVmq2yknyvwH9aC6FBCOf3JwGrroTS62GzJMDzUidF
	+OwIOyPWQQNtylDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=AzsoyU1I;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=21Tiz7UC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1743281170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gepOCVX71QnP7L//Gv8XkzdYtxTZGoyPpdEBdx/FukU=;
	b=AzsoyU1I/ZHzm9Huyy/LcnB+ntO5MsmvoHMcF4UKEP+BPRnZKPk5aAHhEyoOYvscEUd3zg
	HI6q7WeogiTsrHj7Uv9KrhSAmsNF7Ud79GRy0LrWx2wiYjeB4EQahHLMDN4wImKMiRFPI6
	QfGQp7w+TYHS10QNZOcRaAc6AobLF2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1743281170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gepOCVX71QnP7L//Gv8XkzdYtxTZGoyPpdEBdx/FukU=;
	b=21Tiz7UCjeDpZCpRK/pXWmvKhcDU6ntD9Cp/q/xGV3ZX4FSq0vFR5pYBm/TfVG8c6gvScr
	4//4ieViK+OpwVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BCA113A4B;
	Sat, 29 Mar 2025 20:46:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wRTBIRJc6GfjNAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Sat, 29 Mar 2025 20:46:10 +0000
Message-ID: <ed3bd720-6882-48a2-924c-eba7d8801fbd@suse.cz>
Date: Sat, 29 Mar 2025 21:46:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] MAINTAINERS: add my isub-entries to MM part.
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Michal Hocko
 <mhocko@kernel.org>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250326215541.1809379-1-rppt@kernel.org>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20250326215541.1809379-1-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9FA201F38D
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:mid,suse.cz:email];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On 3/26/25 22:55, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> Following discussion at LSF/MM/BPF I'm adding execmem, secretmem and
> numa memblocks sub-entries for MEMORY MANAGEMENT in MAINTAINERS.
> 
> The changes for USERFAULTFD entry are fixups that can be folded into the
> original patch if Peter does not mind.
> 
> Mike Rapoport (Microsoft) (4):
>   MAINTAINERS: fixup USERFAULTFD entry
>   MAINTAINERS: mm: add entry for execmem
>   MAINTAINERS: mm: add entry for numa memblocks and numa emulation
>   MAINTAINERS: mm: add entry for secretmem
> 
>  MAINTAINERS | 50 +++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 11 deletions(-)
> 
> 
> base-commit: 87f556baedc9cca2edb318efe9d8cf009d916c4d

Acked-by: Vlastimil Babka <vbabka@suse.cz>

