Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B00258CF9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747735620; cv=none; b=I7D914ndYZqZBHNpEkLuDxC9vD26/Ar2hLZ7Gm3nTnqUUzKAYvyYTBAqmD12oPLVDwJy3HC4XsieO2Pa/huKRB3q3d9azinvueQJu1jFZeeAb0hulInKXhpfl6aVsLAl9Vgxj5OsDB/lVGqr7MhZhGo5rcOSD6odLbXkHklUJlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747735620; c=relaxed/simple;
	bh=KR+eG51jQepsw2MPwUVR0iLaBK1AWkkoSIFG94Z2agA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NXi3Z6YN6Lt8NrCCwh/ZTcqZvG71SGzLsPYbCLSyaF56vGoe/P2qI9J2DXz7JoSoSSudeJXDkeKEIx2G7Z7qZ2gZJKwDZRxC40yUPf1dosMaQ5OFhwtnadnp1dcomStMOgT+vaTm0laRUoDwQWeKKoPCn6p2fnmK1WrpEc1driA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YIS0P4dA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cc0pvFfw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aR5cvymK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KfKhLc5a; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YIS0P4dA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cc0pvFfw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aR5cvymK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KfKhLc5a"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2C7A422412;
	Tue, 20 May 2025 10:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747735617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tpz57TXxtU+O8+oCaPdenftOt3C5hmAKhHhmQxyyito=;
	b=YIS0P4dAKvX0tjphPWsDKcsfg9S77sb1CT63nHGk0DBNmV9azcxv8GbWUO86T/Nn9f6b2O
	yHcjTVawPLe6vi8gwGdoaUV11mPJJoIwD2Vk8r/C/15q6ATSvd4CkcD/Bhk7kRI0vu2L5G
	Bm6Rawy6Dr7Csxz5jg8aeLIoqA6bj0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747735617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tpz57TXxtU+O8+oCaPdenftOt3C5hmAKhHhmQxyyito=;
	b=Cc0pvFfwMLWc/6+hC4m9X2I09KNf5ioz61hoZfUcVoBpgkfX11EakUe6Dh4SIqiyOEOchI
	9vJRx/a/x8fCJdAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aR5cvymK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KfKhLc5a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747735616; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tpz57TXxtU+O8+oCaPdenftOt3C5hmAKhHhmQxyyito=;
	b=aR5cvymK2TtL7CUpCDCDaAdr2oaUxpEfj+dXsmjcWvxrVMQ9Lb+FACpReXxQsHfPpIbpyb
	KY5ZAcGh3Ivfn2S2NJryhBxMHjm20wGIDA2fXrlO2e21e+qy7gB2VKWVaD19VU24wt0FrB
	wAnFrjbchIiNS/OBPSedkkk2hLnbeYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747735616;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tpz57TXxtU+O8+oCaPdenftOt3C5hmAKhHhmQxyyito=;
	b=KfKhLc5a/ZO5ZoJfQEP1zHU0nMzglAk5/TzEHeyumNoHkWjiXV0nuNMR/5yHYPYK6N0qvw
	+qGO6W0YXS7xTpAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E392113A3F;
	Tue, 20 May 2025 10:06:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QbXENj9ULGj7ZAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 20 May 2025 10:06:55 +0000
Date: Tue, 20 May 2025 12:06:54 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Donet Tom <donettom@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v4 3/4] Remove register_memory_blocks_under_node()
 function call from register_one_node
Message-ID: <aCxUPoW9J_C5_gm4@localhost.localdomain>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2C7A422412
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[redhat.com,linux-foundation.org,kernel.org,nvidia.com,gmail.com,linuxfoundation.org,vger.kernel.org,kvack.org,huawei.com,intel.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,suse.de:email,suse.de:dkim]

On Fri, May 16, 2025 at 03:19:53AM -0500, Donet Tom wrote:
> register_one_node() is now only called via cpu_up() → __try_online_node()
> during CPU hotplug operations to online a node. At this stage, the node has
> not yet had any memory added. As a result, there are no memory blocks to
> walk or register, so calling register_memory_blocks_under_node() is
> unnecessary. Therefore, the call to register_memory_blocks_under_node()
> has been removed from register_one_node().
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

With the comments raised by David addressed:

Acked-by: Oscar Salvador <osalvador@suse.de>

-- 
Oscar Salvador
SUSE Labs
