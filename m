Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D745C4315A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738346757; cv=pass; b=GARHaa+f2FASys8/sQggCEjVc9JhuGZVUBE3DfWrundjY0HKllU+1Qu80xipD2STlYaFu0sBu5A5zM1nuZipE0Z8uIYGtNTvqyt11P+5LcUJKRHkFIXxMJ7nn5H7pB50ha3Mkmf99D9oBqscPfB/Np3LSGqEN5+smbeNDw3cMMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738346757; c=relaxed/simple;
	bh=Xj7nAF1HokwYhi8a8kaMtwzRSfvG3L4b/uXwqS9N5Cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgjfe9C89zfmiVfARYEX6mRX9avCpZJrxArXWx4h+xVB7TqoQeXTC0ngL93G6ruGovZWoi5V0hfiNj5uf82EeO5ZaNeTrVmsAEa6jy5m4yA/c6NfySAJGGgE8fnLdvnOgVIeU1/sB9h37f95kSifaqLi9uSUqSaXpRnx3yJ2L4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=lNpF1Ute; arc=pass smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="lNpF1Ute"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id EC05C8A51DA;
	Fri, 31 Jan 2025 17:58:15 +0000 (UTC)
Received: from pdx1-sub0-mail-a215.dreamhost.com (trex-4.trex.outbound.svc.cluster.local [100.116.71.144])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5D0238A5202;
	Fri, 31 Jan 2025 17:58:15 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738346295; a=rsa-sha256;
	cv=none;
	b=3EmE0PCDiiZoC4JBu0MtSfrbz+6+rT6FKFt/Jv8zoLnfFMIF/fD5uJatzJI1g4OwtCuNMa
	NydLN2jvDMTHUi4imHCGficb8IR4m9ZjGDVzI6o+nEV8Up+MAf2UXT7/dGjwlWrkV754er
	KB6H7UAE6ATS3vaIrvmfDHDZceC2yRTN9xqd4/NozkAyTHtLsbcXAe5PudDy+eHgNbCBO1
	FV7pqkP+2Kdlc3h0LZ4Lw7L+SEjeDgztehWCaeL8a/ZUW7SRPR22E39Ffm1ohCQvZHfp27
	gYpl2kOWd4GU8dUXJfqyjbXzxIGvvAUxWma/ja2NND1Vcx20qYFksX245g5Asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738346295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=Xj7nAF1HokwYhi8a8kaMtwzRSfvG3L4b/uXwqS9N5Cs=;
	b=GF0y7DUSrJhvQPPWIpzeQUiKm+UMM2Ln7HBEY+XyPZQc2XamuFrQSXV8B+bBfOCKyEy1Gq
	ToQTWofjAlo8bMniOvvj+4ggPOnxGYso5j0BZdEqIpdvzNm90+iTDuM1dhwxGN6IqY91/C
	Aq+mpJwHvJScJ1dLkTHuizKcPsoeH3zwrhVOkFHOW8v7RCMlqYkgKqnNziGADZ/j9AgL4A
	Hj6tXUaPRHGDzAC6gwfBLkqaxX6TYc0HYEZx20vuDAxqi4aswIMnEc5g88O+vqC3zPJAD5
	cWaOwBTTWjF4AtYPlEb8LgwMYFitDZa3Yq6pwsX5q3qdkYJwvZ2wyns8neg3Dw==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-5m7bq;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Juvenile-Continue: 52beb83522fde22f_1738346295649_334098669
X-MC-Loop-Signature: 1738346295649:3239223652
X-MC-Ingress-Time: 1738346295649
Received: from pdx1-sub0-mail-a215.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.116.71.144 (trex/7.0.2);
	Fri, 31 Jan 2025 17:58:15 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a215.dreamhost.com (Postfix) with ESMTPSA id 4Yl3XQ4lDSzL6;
	Fri, 31 Jan 2025 09:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1738346295;
	bh=Xj7nAF1HokwYhi8a8kaMtwzRSfvG3L4b/uXwqS9N5Cs=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=lNpF1UtePnKosIswfrACFOtjekaSXQFRR8a0tVIFi76znsk9WgCBMTAkzJ8t2smOf
	 XEwSe3KR9JPfyydx5aUlUPfY/pDUtDI1zOxn7HdMs6+qRSLyN1HmXHJqbB89PW8sMb
	 aLQ6TA2CR9lE8YlPZAUX5kpTrlnpQVkswmmqmRw21wOtv+tdmORf9cD71XeoQtmWq8
	 +nkJaXGTgNc0LTeQSjmJcjn2ytRYLWeeLjmAHq34WYty06jqfsd9qfhZ+o6v+tiohd
	 sMgnVSjE5LsRhTHaT3mBI857OGrvTqNXAmEFqigoJBRY4f/v1+QsIuiBhX2DCaXjpX
	 Gn46mlRM7gfYA==
Date: Fri, 31 Jan 2025 09:58:11 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <20250131175811.37fcmoevcdpeoaj6@offworld>
Mail-Followup-To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
 <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
 <20250131173132.uqjwrzj7e5vx2sbv@offworld>
 <7k2gs6xmx2q7la6kle5xpn2p2f6bccbiv5lrdowp5hnecxpijx@rzwxdhcl6mc2>
 <5fc4e100-70d3-44c1-99f7-f8a5a6a0ba65@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5fc4e100-70d3-44c1-99f7-f8a5a6a0ba65@lucifer.local>
User-Agent: NeoMutt/20220429

On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:

>Keep in mind process_madvise() is not limited by IOV_MAX, which can be rather
>high, but rather UIO_FASTIOV, which is limited to 8 entries.
>
>(Some have been surprised by this limitation...!)

Ah if that is the case then I'm fine with this patch as is.

>
>So I think at this point scaling isn't a huge issue, I raise it because in
>future we may want to increase this limit, at which point we should think about
>it, which is why I sort of hand-waved it away a bit.

Agreed.

SJ, feel free to add my:

Acked-by: Davidlohr Bueso <dave@stgolabs.net>
