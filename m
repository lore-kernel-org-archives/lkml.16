Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A9723CB
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166909; cv=none; b=ptQAAmoCAG//0BVn8eKFoowPpHZqmpfE3YjSg0Nbz78sZ1c6+z9NCOj85G3phWmxXLAvTYlfrYEFW2g6GlwfFLXLZlqotPzszDpBdikPdFu/Dw8ggho3tiF7BPgW9FcenUs+dbIjmEwKq8k4bBmmcjDxPcjkaY/4/Kd0SjlOFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166909; c=relaxed/simple;
	bh=ljJoz9CLywU3mGuMPCN6Ow2Zt9UtUfgYzHW2ucm5TT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBSKmq1jkwm1yyHQ+2iJUrqb7l3MckJjDZuZxG/6tDFuH/nVgtBdzy28CmlEKEihGwvGwDR1+DoEZb8r7Fh8sIStFpNNemmE2kv+iiwX3nYx8FuOAwfQoufSoqWzdBYClH/0jq8ZEZdEdXKjxOnxH0ef+v10GIYN8A9u6LdwFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I3n6QBD9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C5gx73tZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I3n6QBD9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C5gx73tZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I3n6QBD9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C5gx73tZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I3n6QBD9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C5gx73tZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2803D21196;
	Fri, 28 Mar 2025 13:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743166906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TdoruYBkPmSm5fkDSyVCXd87I6vfPQDdFJMTR4FsLDU=;
	b=I3n6QBD9t9QWsXYQzr8wlpW+Aun9y+3rw9E83BZVdytS762G7cJjjzGvI2D1bDNPGmM5+V
	DXWufhSy40N6ECwLJiaMeKrIf81Nok4umDMH4VpwNz22fmDlS89wJI9OYy++dpYQ4Goyjz
	J1L7ci1xtfnWx1xT9TnjqQhtznO4Sas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743166906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TdoruYBkPmSm5fkDSyVCXd87I6vfPQDdFJMTR4FsLDU=;
	b=C5gx73tZJMAvGz57KaQBjGOt58hdake/02dcB3GCm/VJvCjWHy+i9z11BRjc1Cp3GNSqN2
	ItvrAr8MBAhW17AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743166906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TdoruYBkPmSm5fkDSyVCXd87I6vfPQDdFJMTR4FsLDU=;
	b=I3n6QBD9t9QWsXYQzr8wlpW+Aun9y+3rw9E83BZVdytS762G7cJjjzGvI2D1bDNPGmM5+V
	DXWufhSy40N6ECwLJiaMeKrIf81Nok4umDMH4VpwNz22fmDlS89wJI9OYy++dpYQ4Goyjz
	J1L7ci1xtfnWx1xT9TnjqQhtznO4Sas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743166906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TdoruYBkPmSm5fkDSyVCXd87I6vfPQDdFJMTR4FsLDU=;
	b=C5gx73tZJMAvGz57KaQBjGOt58hdake/02dcB3GCm/VJvCjWHy+i9z11BRjc1Cp3GNSqN2
	ItvrAr8MBAhW17AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE98013927;
	Fri, 28 Mar 2025 13:01:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M2y7J7md5meDWgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Fri, 28 Mar 2025 13:01:45 +0000
Date: Fri, 28 Mar 2025 14:01:44 +0100
From: Oscar Salvador <osalvador@suse.de>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] MAINTAINERS: add my isub-entries to MM part.
Message-ID: <Z-aduGY4Nno2BwH7@localhost.localdomain>
References: <20250326215541.1809379-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326215541.1809379-1-rppt@kernel.org>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, Mar 26, 2025 at 11:55:37PM +0200, Mike Rapoport wrote:
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

Acked-by: Oscar Salvador <osalvador@suse.de>

Thanks!


-- 
Oscar Salvador
SUSE Labs
