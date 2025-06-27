Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6574502A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751050119; cv=none; b=OGTFiDQJsAclnoB39F01LsWSSnedr7oMcJ2iHd7qEpIoZsS3ZodTp4PHQuD5mGPU/n6rbH9U14KzEihvoXcfUg4h+yGxfSlyGvvpzNeERvGb2xVo9YIoArDo2hhUcVOZdyU0tg0xwvKOydrArJqeZ/YIoV1VITEHhXsSobaMKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751050119; c=relaxed/simple;
	bh=t5QdGUQTKtZh/w3br7IAj5wQCJkK0wiEdu+3pRAz1b4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MLZ1KdkhXdn17EcgVK1aliZFDl3flD24WkgvFcjjG66VRqiz+NxTVDlFUOj4VZjq2/JXgUf8vllL3mwy5lq5DgCOQFfzmGiryjsYe9A9SIaBGX+4UdaF86hVOKWBoWfyAGmLIhfN07U2GbBj/gzK/QJY6do7dKHvoXLa5ZD1I+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtBUmgom; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtBUmgom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C8FC4CEE3;
	Fri, 27 Jun 2025 18:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751050119;
	bh=t5QdGUQTKtZh/w3br7IAj5wQCJkK0wiEdu+3pRAz1b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtBUmgomkEfTvE9Cr09XadxUpPq1uVa7MkSN5TQTYk4779/vJjZ3fNkqtIXJm7Elc
	 ZxaSc4fiTGY5lahUtAKOG2DG5WmI0twTmLpCIXmiy2cfOAj1ozKTWNcS2wtCx/Y6LJ
	 DgMVSYA2lMKZnBqzXo5tXh4N7KQObpbF5as+J+Udd4VyWpDqP1VdS30qK52FDN/zYv
	 Sv/N5mGW/6WMf2saVzbfJOxZVTptD+5+NFuLuGquqsQZ8p5mrTLy5oOhy/yFHxkskW
	 8OVzPQejgj5JRoaTwtpcGcHKw+0m1k/TGyTCsgtmqhdbNWUh1NdXjnocbYm9tFQspo
	 L6VW1xfvlJ7kw==
Date: Fri, 27 Jun 2025 11:48:38 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 0/2 RESEND] phy: renesas: r8a779f0-ether-serdes:
 driver enhancement
Message-ID: <aF7nhuFWdp80sZTS@vaman>
References: <20250626081723.1924070-1-michael.dege@renesas.com>
 <aF3Qp730y_Vusb-z@vaman>
 <TY4PR01MB142825081D5279CA2D8251EBE8245A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY4PR01MB142825081D5279CA2D8251EBE8245A@TY4PR01MB14282.jpnprd01.prod.outlook.com>

Hi Michael,

On 27-06-25, 04:52, Michael Dege wrote:
> > > This patch set adds the following to the r8a779f0-ether-serdes driver:
> >
> > I have a v3 and v3 resend and both are not threaded properly, Please post properly as a series which
> > is threaded and not broken...
> 
> Please bear with me this is the first attempt to upstream a patch. I used b4 to produce and send this
> patch series. I did have trouble when I tried to use b4 to resend. And ended up using "git send-email"
> to resend.
> I don't quite understand what you mean by threaded and what is broken. Could you please give
> me a hint what is wrong? I am willing to learn and would like to get it right.

See Documentation/process/5.Posting.rst
"In general, the second and following parts of a multi-part patch should be
sent as a reply to the first part so that they all thread together at the
receiving end.  Tools like git and quilt have commands to mail out a set of
patches with the proper threading. "

For me, patch 1,2 and cover letter appear as disjoint so hard to
review the patches when they are split in my inbox.
A patch series if threaded, would appear together so easy to look at it.

Said that, if you are using git send-email, easiest way is to supply the
whole patch series to it and not per patch basis
For example:
git send-email ....../dir_of_patches/

would ensure they are threaded and sent together

HTH
-- 
~Vinod
