Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC64B17F7
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 02:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748141111; cv=none; b=fRjqwSf5cJVBnQUXEKGcqiYt8VJYMvtJ0f0sbpDSuBUZQwGdzNB7fm6wzw6r/1AuZZD5ZszPUfa7utxDP8KB7KBaJaAIlyzQ1lJExJEdpooSwqnl8Jv5uHAXyHCncodgR6sX0AXtVukwaUiZFL+/TzwkIN3MwuxseaMoPpD1xEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748141111; c=relaxed/simple;
	bh=rtwG/KauWlVi/boJ/OWdJCCXw4dm5aA+kAeMNpkMKbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gltc9oxUV8nbmjJnjov11mVdr+NYl2c2bqCgIkaN2E++y5wV6WljzfYbf9VUQKGNnPBbrUGzmMvasP3t3/eMlh0EWOLfmWhE3aevKJlv7IskN39o+VAHb0wgwm03FZ75Ev6I1ItLnJ5lJsEcjuSyknuGAk1M9DF2ra72nEJFDAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h3YdnPJP; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h3YdnPJP"
Message-ID: <0a211ae5-2f13-4b07-b670-39e06ab8a917@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748141097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtwG/KauWlVi/boJ/OWdJCCXw4dm5aA+kAeMNpkMKbs=;
	b=h3YdnPJPptOPwI5k+HAm+LK5YdSV7z5UF8dzowi7Cr9hoSPUV/as6iFXfiJm0HtRJHtVdT
	rhLHRGiV0lfMoTTWYwKls1g9qzFsIVOPgxnObMdgjDFrAp0vw7x3BN5yZbU6AkS/AqJ/5v
	7YZ6HE1zFbKlWjabuV6R4e4GG0+9IuM=
Date: Sat, 24 May 2025 19:44:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 snps,arc700-intc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250505144826.1292329-1-robh@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20250505144826.1292329-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/5/25 07:48, Rob Herring (Arm) wrote:
> Convert the Arc Core interrupt controller binding to schema format. It's
> a straight-forward conversion of the typical interrupt controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Will you be taking these thru DT tree ?

Thx,
-Vineet

