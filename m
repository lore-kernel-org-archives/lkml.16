Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D1625B687
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188225; cv=none; b=KqzZaH3USxvGHdqV86Aw8tqCrK4TCdihbFDjmrl2M8WvQrRYCgRoFbi1XvV+qW5EC89N5dgYaYEuJJTP+P0gTCMuu0MUDOdRf33K8tzULgt6+OGcwUuX5RlEDU0gJbW4aWbQmOipqnx4rXNAR3yIgcaRIYxAXzSvrQN6OOyXw10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188225; c=relaxed/simple;
	bh=NQnrWxqFEYqyf2ImZyom1w6HZbF5aoK8E0yfrdJWcic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5Qd2SXmk6A6nGvrjZWQDN372EDTDSM5MoUdbgRhVgXCSh0jdzmEfkhslpMiz9cdl7QN6BZzopxkUm2fSiYdRR01jkXl4BoaUJmTIodcZJcnHV5E96GZoDYV//h0sgJF5MrZWLeU1pu8OawNACToBVtjBwNFKiq1mAa68H0p+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bDhHhRjU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bDhHhRjU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224191d92e4so61521245ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744188222; x=1744793022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=APlPY4uZJpZya0nV6nrk4xTTTYVm9sn3CRO5bhFqGdw=;
        b=bDhHhRjUxxNhsKR7PLZUVEpSG7df7lFXo8C2oja6Yljc/15LvR+BgrNMVTZabyKE4v
         J5Tvx64P0Y1fbAHksGV91mp1E68/w7ajH1pizgxyJkaySE2Br2CoNQjPpHNPCqtzvZnb
         Vq/PWX8oH0oJgmrEpyZe8JUjIcydgrMzu+ha+A/GuYm5XefW2oCVZ0uuRAG/aJ6UVVP7
         xM5zDWiIMpIv4e93B2wY/RcCIg8HM82uWrWy3ouIqv+OzyEKVNXm5vFU2hDY/lKXtZ0f
         EEpP8U60H+9PwG/aQUfFLLRLCTpJYVaSNx6bA1ip7Ogd2EFn3hvm0kteEir9VZfHwxWr
         Ok1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744188222; x=1744793022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APlPY4uZJpZya0nV6nrk4xTTTYVm9sn3CRO5bhFqGdw=;
        b=XdRIJ/GpaKJOzg/T/ZMd6Ao3tsZoWJkkMlTnGJfyBe3t+QHet4/h+3sVlQPuvGhKxO
         84rif6s2pFvEhOQAyfViFrGfbMYfzMJD9dOc0CkBqehtM6w2EYsCMCtsU5Yqqo/745Bj
         GuXQGrc+P5xeHEIE1n4jYDoshYXFAHwsSPhVnkvZdGTn02JnN0IGMmF4S7OLXhuIqyX2
         pf0YOS8auqAzJPlC6ypbFAjAIMXc99hbjl8yIgkFnHbrOKn6/zLTIs7jKKo0Mu4bvAZb
         PlTM3xmZRgkfrvR6NM3dwrwvjBah4l4F57JoyTgen+IOqsrnAtRvRg6XQrentG3BjYF9
         i7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUeud9/8/xCDPDB8CLHkPLZryUTROOWsNMPdfu3yz3vAxe3GtqArs0nwcouLjTVa3S0BeG3BR6HzLAFlhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdd+OuRWIto7QAYYUo5zYAR4O7SgRLo1EPfGReczx+ozbq6qzn
	LAJCbAnjZi3XZuFAJs5fk6RVK1/kK8QnxXLBcuaO8zo0t21c7tJl61Aq/Ba5iq8=
X-Gm-Gg: ASbGncuewg99v1HeaccOj14hpfTUwqI1psWNSn7sLxXl97HWmoXGPt+wshI0ayhoGYG
	N9zG54ooo4rd/29RIOK6hrV0+yE3CpRK01AzbJuDzrfvlIMOi3lqcoArzfVl4QkXTdauXFz1RKl
	ymSFpf7Lv4rJ8gD+TMErhbB5lfryD8WKcraZuQ3/faTJDwb+3r/tVy+n4CFrO9CvCyq+1Z7+FL/
	vwWEHoEXRJgkQmttaBsSuDxa03vo2GA8zBMyo2s7YZjiO6czxVoXPo5twzAJkwJdv5TiCvBTSgS
	w4ZH8MAUzbreNPOo+bA1WECn6vXi0GGO28f1pNfljatA8W+WbG9KdSXXMHf8u3GdfjCH+tem3H9
	G
X-Google-Smtp-Source: AGHT+IHi1LGSSSpMeFzIdX5goYy1eceYxuwOGowfNQqBnGHVqOjiuDdrIg19B2sb+9bme7Rpg5PDWA==
X-Received: by 2002:a17:902:8548:b0:220:fe51:1aab with SMTP id d9443c01a7336-22ac3fefd47mr23583495ad.38.1744188222535;
        Wed, 09 Apr 2025 01:43:42 -0700 (PDT)
Received: from dev-linux (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb548fsm6337125ad.188.2025.04.09.01.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:43:41 -0700 (PDT)
Date: Wed, 9 Apr 2025 01:43:39 -0700
From: Sukrut Bellary <sbellary@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: clock: ti: add ti,autoidle.yaml
 reference
Message-ID: <Z/YzO2MfhK3HeIXA@dev-linux>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-5-sbellary@baylibre.com>
 <20250405214904.0b07b26f@akair>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405214904.0b07b26f@akair>

On Sat, Apr 05, 2025 at 09:49:04PM +0200, Andreas Kemnade wrote:
> Am Thu,  3 Apr 2025 18:45:00 -0700
> schrieb Sukrut Bellary <sbellary@baylibre.com>:
> 
> > ti,divider-clock uses properties from ti,autoidle.
> > 
> > As we are converting autoidle binding to ti,autoidle.yaml,
> > fix the reference here.
> > 
> > Add dual license.
> > 
> > Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> > ---
> >  .../bindings/clock/ti/ti,divider-clock.yaml   | 24 ++++---------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > index 3fbe236eb565..aba879ae302d 100644
> > --- a/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> > @@ -1,4 +1,4 @@
> > -# SPDX-License-Identifier: GPL-2.0-only
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >  %YAML 1.2
> >  ---
> >  $id: http://devicetree.org/schemas/clock/ti/ti,divider-clock.yaml#
> > @@ -55,9 +55,10 @@ description: |
> >    is missing it is the same as supplying a zero shift.
> >  
> >    This binding can also optionally provide support to the hardware autoidle
> > -  feature, see [1].
> > +  feature.
> >  
> > -  [1] Documentation/devicetree/bindings/clock/ti/autoidle.txt
> > +allOf:
> > +  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
> >  
> >  properties:
> >    compatible:
> > @@ -97,7 +98,6 @@ properties:
> >      minimum: 1
> >      default: 1
> >  
> > -
> >    ti,max-div:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description:
> > @@ -116,20 +116,6 @@ properties:
> >        valid divisor programming must be a power of two,
> >        only valid if ti,dividers is not defined.
> >  
> > -  ti,autoidle-shift:
> > -    $ref: /schemas/types.yaml#/definitions/uint32
> > -    description:
> > -      bit shift of the autoidle enable bit for the clock,
> > -      see [1].
> > -    maximum: 31
> > -    default: 0
> > -
> now you make ti,autoidle-shift required. That makes so sense. A clock
> does not necessarily support autoidle.

Thanks for the review.
No, we are removing the required from yaml bindings and keeping it as
one of the properties. As all clock don't support autoidle, required is
not applicable here.

> Regards,
> Andreas
