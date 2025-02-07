Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7B18DB0C;
	Fri,  7 Feb 2025 17:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948335; cv=none; b=RUzr4NaP/BM/SS6mjS0bA7BUkg+Qvv4KX9bVmL4YsgAr7PMsE6DQE5ZSlirb8W5G5hi1PGb1WDGdlW5MDe3bxF+Xw9duN2h3zKaPUqnNFipZK0t7AnhNZwJeejcPfbYfmSD4DCTsplVgv9RAol4DklckPt92e1b3lfw/4+iJ06M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948335; c=relaxed/simple;
	bh=rmz2f/r0nmLppAgxLqGAFpZzsm5putBHWW8XfcW2Vok=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=G4+H6kDyq6JBQSrYuayqiK8tl7BikBDwrvjEKfTMnukeeCBaM6JQ+i+bpVrnlfd+r8sk0aPi5psHUue5WIvt2uYqYScEkl8n5Xwj3vb7jqv4Jb9uLIPxaevJNyXAepBG0ua0UfKiPlkkazrk3VNXX5TL0aJ6VlEKjucAeL5uNmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=V5/suE0s; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="V5/suE0s"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738948331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJez20VszaxXxj16JRKu4nw9gm00N8RRdq6k9u0AALs=;
	b=V5/suE0s6oboVud4LDBpamVYDrXqsi8RJPxWLTE2+OK9RWMpYDTiGsmDcSVqaI3eWFAz4h
	4gKGUmUH0lriTYz6mztqG53hyQadYcUVIBq2OfILB90liak70DL9Rk2OiSI6CNflipScd4
	PPtIqyvwPkfP1Zuioojr8i7tFgGcbscIdQubYhwO5xrQRUH5PnZ9BI4/15+h4fJgqKGn0R
	Pumgn53Y2HSZ5pOkiIZTp0SEz3u2zWAcnMMpru4gbCFn3V9mEpMCoZobzcoZuq8ETUuAyQ
	1BoJc/fDRKh6YHfHIUmZ0NvUcRB1pep8rK/8vX/P6b7ICZdmZVXZMjqq8Bzq6A==
Date: Fri, 07 Feb 2025 18:12:10 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maximilian Weigand <mweigand@mweigand.net>, Marek Kraus <gamiee@pine64.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on
 PineNote
In-Reply-To: <D7MD194WS7UL.FT324IUB9BIA@cknow.org>
References: <20250207111157.297276-1-didi.debian@cknow.org>
 <502523554b482a2e10d85d37761932a0@manjaro.org>
 <D7MD194WS7UL.FT324IUB9BIA@cknow.org>
Message-ID: <97df4fc0db4bf43a2a3f2d4d110e3105@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-02-07 17:39, Diederik de Haas wrote:
> On Fri Feb 7, 2025 at 4:01 PM CET, Dragan Simic wrote:
>> On 2025-02-07 12:11, Diederik de Haas wrote:
>>> Add the recommended chassis-type root node property so userspace can
>>> request the form factor and adjust their behavior accordingly.
>>> 
>>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>>> Link:
>>> https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter3-devicenodes.rst#root-node
>> 
>> Maybe the Link tag should be converted into a "[1]" reference?
>> To me, this is more like a reference for this DT addition.
>> 
>> In general, references can also be placed closer to the contents
>> they back up, which isn't possible with Link tags, but of course
>> that doesn't matter much in this case.
> 
> I generally use the "[1]" format when linking to specific claims, which
> I could've done wrt the "recommended". But I considered this a general
> background link and then I prefer to do it via a Link tag.
> 
> If requested by a maintainer I'll change it ofc, but otherwise I prefer
> to keep it as is.

Indeed, in this case it's pretty much irrelevant which format is used.
In fact, it may look nicer to use a Link tag, because there are only
a few lines in the patch description in total. :)

My comment was more about longer commit/patch descriptions with multiple
references, which should benefit from placing references closer to the
backed-up contents using the "[*]" layout, instead of relying on Link
tags to bunch it all together at the end of the description.
