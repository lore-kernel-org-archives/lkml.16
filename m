Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E1341760;
	Mon, 28 Apr 2025 07:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825246; cv=none; b=jogtAVcaSVlowySm1W/AQcYIahYhNCUo2oZnZUTxemlG67AWPFKqqJ8jUeQfqocsEct+JK/SRzsI8/Zcg/4mBvlNqPu+kJHkUn9c0cA9rHeZqB1lsTClVlStKdRb/jX+C2RVAJ/9JHfez6yGHG65t8FPpf7TN8mUuPAF93qLKdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825246; c=relaxed/simple;
	bh=vi1FFGviYqENY4l4UkdZHwfaKJ74lXhdSm81hA5tE80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofzbZffbdeOqmy/epmeYMWciFt0Ep6J/Cwums6pmxk9O5XQF2Hhmn9Onuz8sr+nwa1lWjXs3YJBXoYY4O4BC2+/Wbu6kAyJhXgN6v2gm3Cl7ZEQfCczavnaq8tB8lyMkvRrpV1FqjAcOyNCFRDFBm0jUVfs/ojz88Pu0JvxIxVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ7wk+/b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ7wk+/b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A1CC4CEED;
	Mon, 28 Apr 2025 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745825245;
	bh=vi1FFGviYqENY4l4UkdZHwfaKJ74lXhdSm81hA5tE80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQ7wk+/b1qdkAxVTiqwUxYE/7PwY4c0ERDM1lCwj8yLiKtMdRF//V6fLhR14zpG0I
	 U+A7F1uAC0WhqOOV5D6YwN4VSBmJCmmd5PjkfCOOqQdNUtu2RBrReDsmbGh5nRa7pE
	 Ir32BFh5NXk5IRDP2rn8AcSqDD/JFAbGOqvgLnfiacD/x/ugfUvQTFsgIUKjZH1Bq6
	 RQAbULjriiVJVJlagsLlAYw0th++2VsbECPQ1z/lIxcQLnEzjnXG/f1Ay4+b7WgDeN
	 k9NkaCBwbCLS6SJkSdIXKQZCsjuarp8l+b7zEBhH2rQAObxOrBThoBUx5UlxhQPvSw
	 7puYsf3imBR1w==
Date: Mon, 28 Apr 2025 09:27:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: trivial: Add tps53685 support
Message-ID: <20250428-happy-omniscient-pillbug-b23fbe@kuoka>
References: <20250424132538.2004510-1-chiang.brian@inventec.corp-partner.google.com>
 <20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com>

On Thu, Apr 24, 2025 at 09:25:38PM GMT, Chiang Brian wrote:
> From: Chiang Brian <chiang.brian@inventec.com>
> 
> Add device type support for tps53685
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> ---
> V1 -> V2:
>   1. Correct the subject and commit message

AGAIN, please read submitting patches in DT directory. It explains the
order of patches.

With fixed order:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

