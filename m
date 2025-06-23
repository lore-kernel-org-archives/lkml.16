Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A952F88;
	Mon, 23 Jun 2025 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665935; cv=none; b=q2GlslfkYv3BY9Jy+uCMrK1VCzHpx7waUEEOdc0Yh1hlsSWefZnwF0NFTN6piQ90/QmZ4lSLochualE22Fls62iRIyV2B7jG9pB1l0xpyi3D0dvbpjqc8zS7h3U+K5bV0TzrDTzIlmllZkXDy8aWs7HsV37bwLRlyueXv/wsLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665935; c=relaxed/simple;
	bh=NPasebUaAcEImAJDpuMO6PZ8PRDkik1d/ZK9eOZPx6o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:Cc:
	 In-Reply-To:Content-Type; b=becDANpBcKlUN9QKtAzeS5xdyltOvV6Fl6v493vfEJPKnW6KdWSbnZwCG8o6b2Yws/3mMtl3NMF9Zil8hIb1SierEbNEnsjvGf+xTslfDRGgYDuFgEMBszCYKQ2LgpyrTufaRtWejWj+2u/7KGl9zQMXdK+5zIJiouUeZeoS6OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pwY4oUm0; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pwY4oUm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750665924; x=1751270724; i=markus.elfring@web.de;
	bh=0CeWndhcNIl5hI2uPV3nNRmJbfN7h9Zt3nquQBuC0Ks=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 References:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pwY4oUm0X8NLIU2rLJHYOoeWIpzQNf5qCqhTTVP+/0t+SwnpoGtMiQS+cjGJG3yl
	 9KYRljd48Y9R3tmcF5zDL7m/5Za2HgbU2CsF7lkxpveecz2Li7LPtnFvi0qCJ51Tj
	 oz7BCFvEmJuF4IFJHmz+lledSN5tJhNccU/nQGx3TVfVR6xeBlPZFR4N0v7VEyOGw
	 HSB3GGBSryU/H0Gm4fjEjBreuTlPvKFBzLtbbl+I1ljcqaK/MdUPbcPeadICNzP6W
	 Q1KXSHMJA9cuK/OlV1b/gml0aSHLZqaftG2JlPNtPeyRHHN/Hy0Q3T/8JadmbBSYB
	 J3r+OMzPQUd9TYpALg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.229]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MyNwk-1ufvs81wrc-016rg7; Mon, 23
 Jun 2025 10:05:24 +0200
Message-ID: <481faa1d-7171-4657-8dc0-c37b153e6eaa@web.de>
Date: Mon, 23 Jun 2025 10:05:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Passing code replacements by APIs (for SmPL)?
From: Markus Elfring <Markus.Elfring@web.de>
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
References: <2dc257b4-d310-47dd-90ea-9b081727be2a@web.de>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <2dc257b4-d310-47dd-90ea-9b081727be2a@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:MilD3xF2BpV/G3Yl0V/B62GKXM0vi87bwwAPv1k71aM7uonjTxf
 PhxboLO9VVpPUpcnZqXhJYsAgvJdnDeh1acHJpa/x/ivXWPw7S+rDhi9Eqkrj8dY/6KCM2d
 lvjBKEuQzUK+GEnxp6HcjWivJetfPN85vbnIkTkMbuYFJUmdDu+4MthYi3OAfFuEHiBlIXF
 I2NpZ9guKyRzxxUOYgwsw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fvz84xA5Omc=;U5cZQXExZgzxEV8r85OjEiAl5V8
 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
 glpj8URqhziWtOBq8rHVNGSZIN+lPTl2RI/ofg==

> Desirable source code adjustments can also be generated into SmPL script variants.

Will any more software users get further development ideas from an SmPL script
like the following?


// See also:
// https://elixir.bootlin.com/linux/v6.16-rc2/source/include/uapi/linux/usb/ch9.h#L472-L678
@initialize:python@
@@
import sys
x = {}

def store_data(action, input, code):
    """Add information to an internal data structure."""
    x[code] = (action, input)

@find@
expression e;
identifier action, input;
type input_type, return_type != void;
@@
 static inline return_type action(input_type input)
 {
 return e;
 }

@script:python collection@
action << find.action;
input << find.input;
code << find.e;
@@
store_data(action, input, code)

@finalize:python@
@@
if x:
   sys.stdout.write("@replacements@\nconst struct usb_endpoint_descriptor *epd;\n@@\n(\n")
   sys.stdout.write("|\n".join("-{}\n+{}({})\n".format(key, value[0], value[1])
                    for key, value in x.items()))
   sys.stdout.write(")\n")
else:
   sys.stderr.write("No result for this analysis!\n")



Would you become interested to convert contents from any header (or source) files
into more advanced transformation approaches?

Regards,
Markus
