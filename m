Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E01D515A
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 05:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746164152; cv=none; b=BWy7iEg04dZUpATtP3cDtektKstgHSV+/Oz+MBSzTQSNsS/S4jHMIAj+R5OMgpOaMl+xdUuruHRbD5tXrJ4gkTQOJX+VatTL1KPYXxuQdukgSLUltNMpANDSfEFJ+ap+jj4ImVOsfQXCyexfUDexR1BZJi4GbeA4cGbvRBa4MjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746164152; c=relaxed/simple;
	bh=fjjyGO0nWAn+BGWCEtV2vyHl03C2bbF2QF26icstcxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLTLKd3B9E6vsmGEMiGhlo6nHJ4iEBgslG+MQP9wl6k+KCCfSYNRVImF7wztoWS+GkU/ww9tmzRWc2z9/9BgJ2R7EsEgJ/rXUkuDPnmzRVHKDPP2K8A4b8nPZeSHJQa/h37F0KaSSFypPnMeIzIFLj0qvcPcF4CTbTPfijahpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=EsCYa2Z+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=t24JYgHr; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="EsCYa2Z+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="t24JYgHr"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 02390114016F;
	Fri,  2 May 2025 01:35:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 02 May 2025 01:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746164147;
	 x=1746250547; bh=RktAcX83KBw/vrKDxuivrtacy8sbdy0ib8ss9bNvBNw=; b=
	EsCYa2Z+/E1V+v4H5ZrtyMHSMm4CGZhRz4Dkt0fMTZQau2qQfYP1KaLEbSJLss0D
	o1Q9aMypxubJlQXlC6JDGn6eSMnRXPCd6NXHaGj5JfMhGo+ZIlPDvUtFV47Ea71o
	3K7tRGdln6ShIq5EowETHjAg7gim0V22GUf9NtM7cNFPCHp3fVypbi1oelzn57pf
	QXZCGVNa9N1WlbwNTnvs1RdBRVE+maUWRXzJE6ZNwvS7nwpRHeVJ3+H/KPBn6HQ8
	PQjoky/fL8zvDUv27UV35jK/Jizrx+yIBqNYOtb1V6LIWWFBk5PQaGv8mkoEylpu
	pI2cZoxd3GPgRUwb316jLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746164147; x=
	1746250547; bh=RktAcX83KBw/vrKDxuivrtacy8sbdy0ib8ss9bNvBNw=; b=t
	24JYgHrg08lJEtjxbZN9jGjalDQX1uPrCgMT6GWZRxiFUG2k5sX8B9GwH7BmtjBM
	wkKAbbdBMo6jZM6eJHzyiykWaDTVqTrA3QM4BbSO7RxfggMOV2iV0zSV5umwjfhF
	x9omMbwRssAbDFoqgSGxlMbXsE4GpCxJqeYCw1+dGrUdLeF7OZnOc6qHnL6Tlywu
	euQeHFC0ta3/ONS8wE4sSsWg8Plo76RP685BWqGVdojpnJShgXiclvx3c287/lV1
	DtKwnlJKvA5WDIMnCJkn8zHNEUGbWTMBI/PvMUDnl/ECxuRWUaevhmOLJmzxT4us
	bMOjVrANEEOYUQxCaZrew==
X-ME-Sender: <xms:s1kUaJkl6GvyCwo1JqKDIZ-BxWTuA1hP6m4-PXaAAwksPHAdrMgGIQ>
    <xme:s1kUaE2UoSI6i03ih7atid1ZIgZLsAYTS8FG3CU49MDda7NJWpVOj7cFl6u0T1Wkk
    I-_8b1cHJX0Iw>
X-ME-Received: <xmr:s1kUaPqqZV6U-DJX5QNUXLGfhSPueL5F55a8qGh5lx3-aQJQNCzwoHgwERqlT7NEDjeqr8mfSILV1tVxp33Q5V5SlU5LlFY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeduiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
    fvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepifhrvghgucfmjfcuoehg
    rhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepleehheduudeugeegje
    fgheeuudffheevueekgfekueefledtjeetieeutdekkeelnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpd
    hnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjghhr
    ohhsshesshhushgvrdgtohhmpdhrtghpthhtoheptghvvgeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:s1kUaJnUQTiVdMu_4SOnqy2bQYajzeSh2JogvP7H8j6JClAT_zBWOQ>
    <xmx:s1kUaH2_WADCup1YaN8VvSDAHYgLiXqeCX8s3UP4NMtkBeJ_V1BeOQ>
    <xmx:s1kUaIty9k9sduEMJSK-dtCq6yTWAh-EXZiBe9VJiZNwCfoW6PmIrg>
    <xmx:s1kUaLU4mQtRC3yTw0Q2dCOK2zR3VWYwx80q4_pOr0w0XauEaQP69A>
    <xmx:s1kUaN_4DTukFTSXWeT337U_gcAdm-xQDZqtK4JZGVWwIvd6Mfy0SZ8j>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 May 2025 01:35:47 -0400 (EDT)
Date: Fri, 2 May 2025 07:35:45 +0200
From: Greg KH <greg@kroah.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: CVE-2022-49816: xen/pcpu: fix possible memory leak in
 register_pcpu()
Message-ID: <2025050238-gents-policy-dc22@gregkh>
References: <2025050131-CVE-2022-49816-0190@gregkh>
 <917da057-adfd-4002-ad2b-f2a6ac3a00ee@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <917da057-adfd-4002-ad2b-f2a6ac3a00ee@suse.com>

On Thu, May 01, 2025 at 08:19:47PM +0200, Jürgen Groß wrote:
> On 01.05.25 16:10, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > xen/pcpu: fix possible memory leak in register_pcpu()
> > 
> > In device_add(), dev_set_name() is called to allocate name, if it returns
> > error, the name need be freed. As comment of device_register() says, it
> > should use put_device() to give up the reference in the error path. So fix
> > this by calling put_device(), then the name can be freed in kobject_cleanup().
> > 
> > The Linux kernel CVE team has assigned CVE-2022-49816 to this issue.
> 
> Please revoke this CVE.
> 
> The issue can in no way be triggered by an unprivileged user.
> 
> The memory leak could happen only either during boot of dom0, or when
> hotplugging a physical CPU to a Xen server.

Now rejected, thanks.

greg k-h
