Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103273D984;
	Tue, 25 Feb 2025 19:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740513476; cv=none; b=hYgj7uqdzM1f8ckPMLagaCdnTStPxTdDXO2zenwEw7SawJXuzyWXAca/Gz3KlW680RST5XSSBoYfrDyofVGCcDWWogRTvM6+DEoGAvEtdyv/Q46QAffue4gr+jIkUSaky7UYpuI0ji1wGDfwxp/3JRR8C00/sASAlOepFzoeXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740513476; c=relaxed/simple;
	bh=M2HdBmeejfzkByTk1zRaycFBY7nLElbSoSxzEZQP3rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aO7Re/pc3OzJOD+1GfkXhjzmH7h9Ocr8xeS9XPclBCu3vbxK57zasoCW5bByQtqElzuy+hyGQc1DT1WjErJtvBhNLHPzNBDqgEJcY44COBuP4lFjk6esG4q1fFLougoHrlo23ZJOY8MbBy/wTQ7/q9d9v9b/Ewhh4DSQX7WcUQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIcR9TLp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIcR9TLp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6916CC4CEDD;
	Tue, 25 Feb 2025 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740513475;
	bh=M2HdBmeejfzkByTk1zRaycFBY7nLElbSoSxzEZQP3rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tIcR9TLp3OV5a0nXXIrMKzh7nC0qvfbG001b/v4Cp3s5+vtDs+Ie8RL534SO5JUqJ
	 GLXYV9NWp3oHBL4rzcE9bTtoY79dCTLBv4h2InO+IwamEZdV5UZGA25PUvLEoO4L/X
	 Dwkk4sSZWCj8+WfYiTSobFI3t62PNNBYDAZvcTUzcYWP8JEXPf4zDqvhioOF9NUG6Y
	 7QBTROC29pIJSccmLK+mkXxnU3GrPepzO9B3cfIa+jHEkqcIt2J0nshh4EpAwbI3b6
	 ldgltrITvQHLuphdRSwcxbLqnpSpucOwj7fKTe0+s14wMEDK+2icMqDW5vWKTuUxb0
	 qXKFYEj5viuVA==
Date: Tue, 25 Feb 2025 13:57:53 -0600
From: Rob Herring <robh@kernel.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH 3/5] of: Correct property name comparison in
 __of_add_property()
Message-ID: <20250225195753.GA2907894-robh@kernel.org>
References: <20250224-of_bugfix-v1-0-03640ae8c3a6@quicinc.com>
 <20250224-of_bugfix-v1-3-03640ae8c3a6@quicinc.com>
 <20250225143844.GA2279028-robh@kernel.org>
 <e6faab90-b4f3-4c73-b486-2e44d15d22a2@icloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6faab90-b4f3-4c73-b486-2e44d15d22a2@icloud.com>

On Tue, Feb 25, 2025 at 11:04:55PM +0800, Zijun Hu wrote:
> On 2025/2/25 22:38, Rob Herring wrote:
> > On Mon, Feb 24, 2025 at 10:27:59PM +0800, Zijun Hu wrote:
> >> From: Zijun Hu <quic_zijuhu@quicinc.com>
> >>
> >> __of_add_property() compares property name by strcmp(), and that is
> >> improper for SPARC which wants strcasecmp().
> > Except that 'name' is the nodename (usually, with a few rare 
> > exceptions). Sparc node names are case sensitive, so strcmp was correct. 
> 
> Here, it is property's name and NOT node's name.

Sigh, indeed... Applied.

Rob
