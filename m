Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B92C3255
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895921; cv=none; b=AnVrH6Eda7sJtFMJDSS60s8x7KbfmtLXceDwMKIbbp5Pjpvt83q0ETpQTvyBQ3E8dyvPYk7foqQ1oE378VZ/csuZxBYj/FbuTgmLx/edsDFFHei6DaSfy8/bJOwdWF4PkEVpv94zbIwYfHhDHNUkDcA9TbEv/vTlaHx8US4kmws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895921; c=relaxed/simple;
	bh=QDsl9t2YEmmuQamk2XONRXJttu0U08QJn4stvPkU3nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLz5thSm44QTtYE1aUOO6Cvy54jxrUZ+uUsc4i6X92SI08I6VyNjPIVo4Rjn1IklWyL2GDHTdiLSJjDOSE11OsV3Z1WHo9lGjp8LLt/Ou1oQN1TEtEIg44RKvJEnd/J+prRaYsdV+/0CEzO5+3WxitW/vKA/M9Y7cPs8ZEsNBnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=IrRghkfJ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="IrRghkfJ"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a43d2d5569so37592431cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751895919; x=1752500719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obIaEnQHyCk5QS48auX/2Kc2FC7ZvaEgBFlZseeyMAs=;
        b=IrRghkfJO3IwNRCwCbc7wUYvX1htcur/rkkF68IyyDG8NVkmN1hjzAEiSVluaX7O6J
         TY3uC1Qyf8Bfit4E1VLtxx3IduSwZ20AjsyokVOZ9UQ0MGVf0UevpbGI9VOkrpAUMxaC
         pp2BFDp3l9MxyDFwipvfNRfiQPJt+1GlwzOSMMuOk1c4tFvAl/dDXplcisWKvqa0gCAC
         sgsOvro8h+yKqWggjpGSVbaZ4AXpqzseBe0D6cS7jCmZF/qznxwzqzEzuxwWGrZy1gtT
         WCex2EJqsgPNAPnpAXkD/RQepuz+gv7G/EbtkK7NTfsQud3accNhQArJL9TGY77EQsdn
         8bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751895919; x=1752500719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obIaEnQHyCk5QS48auX/2Kc2FC7ZvaEgBFlZseeyMAs=;
        b=Ze3NO0bVnRR1eAf/8yW/D/9QfaczN8Two5RGiWUEOETXSzW0HiEv9nmKTv6NrsGVp7
         Pu85QKnRkxeDeWG6rFvADHy52J0L8oTBuaXwmeBXsGHvtQfDtsAVE+iaQ849kbWXT5G2
         sYFHvOUkAAsVMuB4A5kToVDDcWljTn4gb1wJT7JePKZ172zw+kmW17+R9L+FmMys8HEO
         nUQRPphyVcPtD/tZJdjCAK+TbwN7mkcFSFzW4a+I0ZSfin+xn4IU0kPRcdRC7rDE4C9I
         T90nhjRQAuVoRduCyFxAREr+OFdaqovBXbM3CLFYdHyp8KCPzx4TJ2LPWHgxWdY37SIq
         QEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpAFBln8zKhtwPCbGiyjsMpy+I37WNwF0b29WXArIiO6Bm4ACm4jPWYErf7s7PtkO2YAmG/nQwZTaF9/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9eTAWxUgkCpvvaUHTdnHyGL1xNkM7TSWwU6b8qkfYpkr7u+x
	7KOVpNIVv7bZ3PZQpAVky18hNrE6WgYyYkGTbYefKGs+p7/ocqIf42gnP/N/t+60Kw==
X-Gm-Gg: ASbGncuRcGBK/QuU9uR7/5kum8OHylUobzVcuyLImgzzTmadCq44b8e8423PHiq9ZXw
	ddhddFSk7/tojCMrDtAqwgIP1pkDKstkGQshju4lQbmi+sePORAdgQ+JOIhku7T1D0QqEGpMOhh
	GG5a8JJePOTeWc315o4TH1pa809i/Xdp+wBNVF+PQ0dlbJvSEF/17nx4zTrJk3pPKH//RnNHIuw
	lSpbYxchzm2LlHYioYemxp5nq0SQczphXIL7M73n5sQrl3UaB9x+PdKTmykxCYfpysHWJcCUDTv
	7NYixDgqZkujiaPUR2K8PB9ysh4E3DMM6uPqeRiwvTDFGBWxfQaVOwj9p6LVIpio0109XYFFYQ0
	pn0bYOlOjx6Z+AK0=
X-Google-Smtp-Source: AGHT+IGi5sdbR8Yp9UGq9pviEO+RlKtWkQ+/NV+d3M1iFgpnz+i81iMMfB9kHMTqaC7aZmhLIBKb5A==
X-Received: by 2002:a05:622a:548c:b0:476:9847:7c6e with SMTP id d75a77b69052e-4a9964816ebmr210725461cf.19.1751895918890;
        Mon, 07 Jul 2025 06:45:18 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949faf39sm63783901cf.28.2025.07.07.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 06:45:18 -0700 (PDT)
Date: Mon, 7 Jul 2025 09:45:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Chary Chennoju, Srikanth" <srikanth.chary-chennoju@amd.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Chris.Wulff@biamp.com" <Chris.Wulff@biamp.com>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Kalluri, Punnaiah Choudary" <punnaiah.choudary.kalluri@amd.com>
Subject: Re: [PATCH 2/3] usb: gadget: f_sourcesink support for maxburst for
 bulk transfers
Message-ID: <e5f4942f-4a0d-44a6-a2b2-7d567d4d0ddc@rowland.harvard.edu>
References: <20250704114013.3396795-1-srikanth.chary-chennoju@amd.com>
 <20250704114013.3396795-3-srikanth.chary-chennoju@amd.com>
 <cf2940e3-5430-4e84-916b-608c33028a7c@rowland.harvard.edu>
 <CH3PR12MB872633800DDD386DCE8169B6B14FA@CH3PR12MB8726.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR12MB872633800DDD386DCE8169B6B14FA@CH3PR12MB8726.namprd12.prod.outlook.com>

On Mon, Jul 07, 2025 at 10:49:26AM +0000, Chary Chennoju, Srikanth wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Stern,
> 
> Thanks for your comments. If you are mentioning to have a check for the value which user is providing, then there is a check which is carried out(#34 to #37 in the patch). It limits to max burst value if user exceeds the supported value.

> > > +     /*
> > > +      * Fill in the SS bulk descriptors from the module parameters.
> > > +      * We assume that the user knows what they are doing and won't
> > > +      * give parameters that their UDC doesn't support.
> > > +      */

In that case this comment is wrong, isn't it?  You don't assume that the 
user knows what they are doing; you do check and limit the value to 
maxburst if the user's value is too big.

Alan Stern
