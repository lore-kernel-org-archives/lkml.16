Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2AC152532
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744132561; cv=none; b=Hpz9zwofR3/jhLAdaGenqsll+pJWZHH6heJ25VIUk0C7MhMUQYiOS34YbrEgdiVfuDkxhHm5RhLh4s1Y1MWeQ6kBpQedlqEv3dtukqOYPZ9cYn7kmiIO1fQriTOfnw05lwugymDNAW4Fm5/5O61MUgBDpUcET4qsV+SYfY27JVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744132561; c=relaxed/simple;
	bh=+VvQP+mjfJDGDMFkKUdxSWXUqOh1jGtEhT9k+khcEoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=itZKDmGh+8/MRElCWnfVMnHeZv0iJJ3W5/J748eKxEztV+l9GL9yvmLsZmW3jdoIMmbHS/wJL5ygqfMBds2eiBt6JWkS34fO1dlgjg4cVAaqUDlJbn4KXY8wI7HS1nIz020HyNtRXEwSni/9my2TyCd1z7C3GgovOSlCXp09KxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nKr96tU5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=I1hJi2J2; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=nKr96tU5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=I1hJi2J2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nKr96tU5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="I1hJi2J2";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="nKr96tU5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="I1hJi2J2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BA4E21172;
	Tue,  8 Apr 2025 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744132557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFDkzudU6b7rRTJepopLEUgnc++zltkgknW9T8h6Oz0=;
	b=nKr96tU5MnGdf+sY/Lt+sBC0bgbD3DmIHIOXOIbe4eIpC51EXegJz28/aPaepjcUVsSjUy
	IhK7HHpcFP66jO/sJKzRI5/t6cF+t6xIbUlv6AwvGTmUmG5rxXhV7yuTxHJWACza32OFqb
	IVtTxp20F2yl4VBMiFRPY6elrI8mrtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744132557;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFDkzudU6b7rRTJepopLEUgnc++zltkgknW9T8h6Oz0=;
	b=I1hJi2J2vsdpcvukNYGunV4PQiW05o0S1UN6NVTV3wahbjjAB6C4K5SK2ROuLL2ntDipLl
	tHoYDyC/VrvQleDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1744132557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFDkzudU6b7rRTJepopLEUgnc++zltkgknW9T8h6Oz0=;
	b=nKr96tU5MnGdf+sY/Lt+sBC0bgbD3DmIHIOXOIbe4eIpC51EXegJz28/aPaepjcUVsSjUy
	IhK7HHpcFP66jO/sJKzRI5/t6cF+t6xIbUlv6AwvGTmUmG5rxXhV7yuTxHJWACza32OFqb
	IVtTxp20F2yl4VBMiFRPY6elrI8mrtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1744132557;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fFDkzudU6b7rRTJepopLEUgnc++zltkgknW9T8h6Oz0=;
	b=I1hJi2J2vsdpcvukNYGunV4PQiW05o0S1UN6NVTV3wahbjjAB6C4K5SK2ROuLL2ntDipLl
	tHoYDyC/VrvQleDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 65FE813691;
	Tue,  8 Apr 2025 17:15:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nlOBGM1Z9WfkeAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 08 Apr 2025 17:15:57 +0000
Message-ID: <7c60fb0b-fc28-4a69-836a-5cc311890300@suse.cz>
Date: Tue, 8 Apr 2025 19:15:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
 <acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
Content-Language: en-US
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,nod.at:email,linux-foundation.org:email,oracle.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 4/8/25 19:00, Liam R. Howlett wrote:
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250408 12:11]:
>> The madvise code straddles both VMA and page table manipulation. As a
>> result, separate it out into its own section and add maintainers/reviewers
>> as appropriate.
>> 
>> We additionally include the mman-common.h file as this contains the shared
>> madvise flags and it is important we maintain this alongside madvise.c.
>> 
>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
> Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

> 
>> ---
>>  MAINTAINERS | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index de97cd54ff24..325424a53acf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15552,6 +15552,19 @@ F:	mm/vma.h
>>  F:	mm/vma_internal.h
>>  F:	tools/testing/vma/
>>  
>> +MEMORY MAPPING - MEMORY ADVICE
> 
> Advice or advise?

For me "MADVISE" would be the most obvious but I don't really mind either way.

>> +M:	Andrew Morton <akpm@linux-foundation.org>
>> +M:	Liam R. Howlett <Liam.Howlett@oracle.com>
>> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> +M:	David Hildenbrand <david@redhat.com>
>> +R:	Vlastimil Babka <vbabka@suse.cz>
>> +R:	Jann Horn <jannh@google.com>
>> +S:	Maintained
>> +W:	http://www.linux-mm.org
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>> +F:	include/uapi/asm-generic/mman-common.h
>> +F:	mm/madvise.c
>> +
>>  MEMORY TECHNOLOGY DEVICES (MTD)
>>  M:	Miquel Raynal <miquel.raynal@bootlin.com>
>>  M:	Richard Weinberger <richard@nod.at>
>> -- 
>> 2.49.0
>> 

