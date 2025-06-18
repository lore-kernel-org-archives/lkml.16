Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FB15746E;
	Wed, 18 Jun 2025 03:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216444; cv=none; b=G6dIjI3RLqZCbvTkzWr/ZWws11bvBvGjA8j9TuS5KFK6Ni6vy+huDgCRFtLvW4vz+qluHPLsJrlQZD7TdUCk2Kt/1hAkXQ3MYtAMJmvMVYpUaLTmOCxg3zNUGCujhj/BxVRSmSMMQ7V87IjRsXvVJu6PgmJ2H9M1t2JeI/DFpG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216444; c=relaxed/simple;
	bh=qT86h424nYLdTAkOvz9ER5uOyajwYCePBdeQLxVucz8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=niCGtr9JWniqpJUvyx2+AxPYSKwpwGI/fRc1WZdg0sJ1ZzQojZ4Dq/wT38ssphJgL3Gjn0VYamj16t4el6zu1tYhuI8JGphTkrgqbe3UUjJ639mKaG3j+vLm21uIgQ4KbpLAQQfifm7GWQB6vQfKoXOnFSWr0JFSeUApdu6SoAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=jR+YlHRq; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="jR+YlHRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750216441;
	bh=qT86h424nYLdTAkOvz9ER5uOyajwYCePBdeQLxVucz8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jR+YlHRqfz8YKs+mED5IYWbU351OPKnz7teywKpYcWH+65SpUb1gMqspwKGQ1bjk/
	 SacJf8XdpGfnd+N9l/OzTrEdG3j8geM9WU+7UF/RODEgfvdvPzTO5CbHeBpqCTAo3b
	 kVJgy9gR7HWRn3d8h5XJFrnkvGeOC3rTynsEFPX4ZzIspNhPVTdH6iUDnNX6KaSv7m
	 dgp2CzJx87nrFA+jcs023omehUCFnui5Djl/MTXAn6batm822RL23a54wtzGWD7A/Z
	 ekALwKYDeIuXBMcYTvUqCjPQxJwhERWfKKsvKIHl8LEfmQNzUUoRmQu7X9Rj8idKwF
	 8jWB4wjNvSodQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFA7E640A0;
	Wed, 18 Jun 2025 11:13:59 +0800 (AWST)
Message-ID: <3fe67d60b145a1aaf1ceb19cc490d22c6aec27bd.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] arm: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marshall Zhan <Marshall_Zhan@wiwynn.com>, patrick@stwcx.xyz, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Delphine CC Chiu <delphine_cc_chiu@wiwynn.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:43:59 +0930
In-Reply-To: <20250616091456.360388-1-Marshall_Zhan@wiwynn.com>
References: <20250616091456.360388-1-Marshall_Zhan@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-06-16 at 17:14 +0800, Marshall Zhan wrote:
> From: Marshall Zhan <marshall_zhan@wiwynn.com>

Can you please fix your setup to eliminate the From: line? It's your
own patch sent from your address, we shouldn't end up in this state.

Also, can you please capitalise 'ARM:' in the subject?

Andrew

