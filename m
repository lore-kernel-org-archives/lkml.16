Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F448C1E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626434; cv=none; b=oBeWrgYhtAxg/1swO1J7HMCNhofKtcjeTt1kLncIyaTg2qiofkVHAxa45iDtWogoO3Oncfnu06yMRijOi556PXQTDrAiH5QAsVLINWelA0u0bopig9yEFinff3RDi2K+K3q8ekfDkpH3QJlkDulHwJdk6BIJo3zLlv2SAYUKfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626434; c=relaxed/simple;
	bh=NwtgKP/1Bpu/AU+dPZrcXjDVLispyZfNDe1bO/HuWG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLhdwqtbZSpp9Rp3Y16rxEju5ouqGniFgrfZhtj2NJTTkT8mALO2oldR5zuTeWEYd++NBL7yUliqOPtpT/qdhlx6B/Z4rpRXqpbLClfiHbJB+gioXfR0gp850gdZ2Vb+qHG6skjJgT9lGi0J1a/Ot4WbyE5ky6F9kXYVy2h2poU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0nLRhv/v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BJyz950A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0nLRhv/v; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BJyz950A; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0nLRhv/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BJyz950A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0nLRhv/v";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BJyz950A"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AE1A92122B;
	Wed,  7 May 2025 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746626429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+jC7fhLj+zx5bCmc1OemyfyZibCKf4H3PvfP7t1Rlg=;
	b=0nLRhv/v9C+FvQhgyVUXOb5CO5j0CtS5fJyq7jr+KpkVn7H29u7a5x0g1WGKYa81C61yjY
	jaIXCv1P3e7mQ0eenbjZQ1jlmOwCCDGWJjocQvKpFZo/3N/tsCAttzcUQE7NAUFc2Siug0
	IaImq7aUTM4ayCPKUa/9ZqSe8fiNlHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746626429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+jC7fhLj+zx5bCmc1OemyfyZibCKf4H3PvfP7t1Rlg=;
	b=BJyz950A1OUc6XpNTxr3Shdg0chPghJT9oTy/xvxuQIaWuy/EOZ97z5dGm8yJhCtBUqZsP
	ItUIeeueEM535hCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1746626429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+jC7fhLj+zx5bCmc1OemyfyZibCKf4H3PvfP7t1Rlg=;
	b=0nLRhv/v9C+FvQhgyVUXOb5CO5j0CtS5fJyq7jr+KpkVn7H29u7a5x0g1WGKYa81C61yjY
	jaIXCv1P3e7mQ0eenbjZQ1jlmOwCCDGWJjocQvKpFZo/3N/tsCAttzcUQE7NAUFc2Siug0
	IaImq7aUTM4ayCPKUa/9ZqSe8fiNlHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1746626429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v+jC7fhLj+zx5bCmc1OemyfyZibCKf4H3PvfP7t1Rlg=;
	b=BJyz950A1OUc6XpNTxr3Shdg0chPghJT9oTy/xvxuQIaWuy/EOZ97z5dGm8yJhCtBUqZsP
	ItUIeeueEM535hCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9316E139D9;
	Wed,  7 May 2025 14:00:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cjaAI31nG2jRTgAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 07 May 2025 14:00:29 +0000
Message-ID: <1ce2a108-1b20-4ad9-ad29-ea4721c938e1@suse.de>
Date: Wed, 7 May 2025 16:00:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/14] nvme-fc: do not reference lsrsp after failure
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
 <20250507-nvmet-fcloop-v6-14-ca02e16fb018@kernel.org>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20250507-nvmet-fcloop-v6-14-ca02e16fb018@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]

On 5/7/25 14:23, Daniel Wagner wrote:
> The lsrsp object is maintained by the LLDD. The lifetime of the lsrsp
> object is implicit. Because there is no explicit cleanup/free call into
> the LLDD, it is not safe to assume after xml_rsp_fails, that the lsrsp
> is still valid. The LLDD could have freed the object already.
> 
> With the recent changes how fcloop tracks the resources, this is the
> case. Thus don't access lsrsp after xml_rsp_fails.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>
> ---
>   drivers/nvme/host/fc.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
