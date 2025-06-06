Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193021A5BBF;
	Fri,  6 Jun 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225485; cv=pass; b=FtbsgFIRfOGO84xXTTFurRPTTIjrdUN+5Pvng3vk98E1vMhRCQ4b6k8VAvO3kGlS5Z7OhOyUHEI83rFXvsCyatOyAGp2UvBvstD8xsDv/Y/giFE7PVMpsK60/0Zn4SU8d7uw1ESbrLlmvW4FALmSuVxyg+E85tXSC7iHQBpC6n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225485; c=relaxed/simple;
	bh=vycj8gjcEZ+bm23D5leWAwXb3RRniPJSFGDD7+kMt9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GwmT9j9b8F0rysRv7zz/80OpKT2OK+bC6fXzXJdF2mLd1nBR9ddeNSYCVV77lr4uC6Mqkk7t+vwSMum+bX5lSc80Apuvvcp/rtIIsLn0dRf+dQSxBh/5UTOa2o0lswq9nWXpy/2Cf3shpza8u9Y2NLkHVELB6CPuEt5k/7SI67I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=QH1vKODG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="QH1vKODG"
ARC-Seal: i=1; a=rsa-sha256; t=1749225476; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NYZ7f8leMzC2ymDf3ysaAlOhnBwwfo+ICLpMWRoC8PrrI0qAwJ5NbQnxtgOP/OosZ1QrMQA59r9AghzbbcrmNUOqfeESizPsSoGFooTDpvnRQDSAiCclLClyCXznY9jSUjCbZr/Enjp26BSTrhWfYpqqa6wAPZRQosy7v6Dtkkw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749225476; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UBFyDDLc1XMNjUwKbv/5YR9uucwhhwGf+YONUGBjl8g=; 
	b=I+eMS1tc5tmRURjI70XxKj6enoKvFOPz7hPJFOC9b1XNbLfcdKITykSJDhVGPDKJ21Z1IcKaHoPCE0f0aFrgvfPdKZFHNzCM82QohxMsEbBtFaV0Zvwk/WoL7QtAdsPc0hcrRNoiz9r6vm0Sc5Ll1Rgk9wMjLM7f8bT7H59+kAA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749225476;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=UBFyDDLc1XMNjUwKbv/5YR9uucwhhwGf+YONUGBjl8g=;
	b=QH1vKODGwgXA+YBqRmYjQxTmkO1kXSDZhxvktEsX79WdRhgSqOCz7D8kV5WzXtrl
	DRojKpWVnwF6bOpE5/2T55q7l3N/WmG/sZ1BmdiWCkkJCBJZ5nDl42hZ+O1nzArN+od
	jj84BxhpK6BCSyTC22BnWNBI1UK0yRJKg93dJAHE=
Received: by mx.zohomail.com with SMTPS id 1749225474614216.59788784587943;
	Fri, 6 Jun 2025 08:57:54 -0700 (PDT)
Message-ID: <24f62de7a5560d6dc093ba57af5271b5aa03d244.camel@collabora.com>
Subject: Re: [PATCH v2 0/3] docs: some automarkup improvements
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho
 Chehab <mchehab+huawei@kernel.org>
Date: Fri, 06 Jun 2025 11:57:41 -0400
In-Reply-To: <8734cegndo.fsf@trenco.lwn.net>
References: <20250604143645.78367-1-corbet@lwn.net>
	 <ebeb020a-8403-441b-ab02-f017ffcb7b83@notapiano>
	 <8734cegndo.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Thu, 2025-06-05 at 10:32 -0600, Jonathan Corbet wrote:
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:
>=20
> > The only other thing I noticed is that the links in the sidebar
> > still use the
> > old style, since they rely on a different CSS selector for some
> > reason:
> >=20
> > =C2=A0 div.sphinxsidebar a {
> > =C2=A0=C2=A0=C2=A0 text-decoration: none;
> > =C2=A0=C2=A0=C2=A0 border-bottom: 1px dotted #999;
> > =C2=A0 }
> >=20
> > That makes it a bit inconsistent style-wise, so I think it'd be
> > sensible to
> > update that selector as well to follow suit.
>=20
> Sigh.=C2=A0 Of course, making it exactly the same doesn't work well due t=
o
> the shading that we already use in the sidebar.=C2=A0 Since we know
> everything in the sidebar is a link, I suggest something like this:
>=20
> =C2=A0=C2=A0=C2=A0 a.sphinxsidebar a { border-bottom: none; }
> =C2=A0=C2=A0=C2=A0 a.sphinxsidebar a:hover {
> =C2=A0=C2=A0=C2=A0=C2=A0	border-bottom: none;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 text-decoration: underline;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 text-underline-offset: 0.3em;
> =C2=A0=C2=A0=C2=A0 }
>=20
> That makes the sidebar relatively uncluttered, but still lights up
> the
> links in a visible way when the pointer passes over them.

Personally I'm fine with either approach. Just note that there's a typo
there, should be div. not a.:

   div.sphinxsidebar a { border-bottom: none; }
   div.sphinxsidebar a:hover {
       border-bottom: none;
       text-decoration: underline;
       text-underline-offset: 0.3em;
   }

--=20
Thanks,
N=C3=ADcolas
