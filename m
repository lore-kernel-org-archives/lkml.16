Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB92820B8;
	Tue,  6 May 2025 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541802; cv=none; b=OTLuFPLS0206mzQ/MdlUHJxqKvbK5TkJwlGgecnpbMzYdElDqtBMxDSir/Whm5llKFWEUlMDP1eGYlSrX2pFE1g8qKHZvmhMGgagCotVPfet7EnavDUcurRiw+TmC5YjIv1AO3FMaAOcac6Lvm7DJGXzkVty/38d9ALH4i0pB1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541802; c=relaxed/simple;
	bh=A1H3TXwOP419hOv7YtURrPgGfrLKrYvyzqZVBda9Emw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjmrQQ9Nef6TRmraQ+1KX8IuGQc8hfcG7dVSFrn4gbiqSOXA+HhDLT3KB+i+1dYk+JIVf4kn5q1Imkd00x8dFDisIfXH8Fyhc+MQ6q+MfSlefq5J7MgTBXxJCVon//JQGKZuSLcxH1QAclB1IJRhFyrFimbR8LJcRP+O2mAe8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg89lbwO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg89lbwO"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54e816aeca6so7388708e87.2;
        Tue, 06 May 2025 07:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746541799; x=1747146599; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sljW97pZ6uaoZQNHWCGt8IHp/aX282c5IvFtjIqBmN4=;
        b=hg89lbwOoI1dcFwkcDCb2++CNuvSZ0k+1yWgLm7I817gvA1U9ORU6KOKLGQS5qZ9W1
         EvgfMRuJbJnd6YQnDz/+Onmp76WQdds1dh6DUZXKt8wV8+qIeE9LszICT6yI9CD3qo0G
         7P73l8iEOgeGpnx+5Wn733TPNf+lCivQiMOL+UMAvmK0RR8B/W/uVkh9tuOFP/YVDT0r
         YfthxNJDZqVSvg26MrE/4DxlqMnUK8Tts6flUoszEf8hG18S+pufNzehYZ8My8xuk8/n
         qMQA53EfCe/OUmFADqsJKUwE0uEy9SCy4sIN6bU4TEUyJbziTPlg730/m/5VnhFDTIe/
         U6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541799; x=1747146599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sljW97pZ6uaoZQNHWCGt8IHp/aX282c5IvFtjIqBmN4=;
        b=e7qv9OFb8wHoRMBmyQaE0GtIw3N9a8tFzKDQZFTc11kI1TR5zWbmPrya6pjSxH2a0R
         iSdqFwbLhmDBRZBdI9yNLHfkdJgB9Bh1d51oKqBexxG88k9EFjPlxxVPpp2ywhULPKPr
         vT3q8naKp90rTanhq3TrZZ57/Vx7OpdXhFtO16FA2A9AqHBiHW5VELh4RQe6JqOVxq0h
         6WKFUjnkf/oDQkmhzobBi/Fv/YqSkyO2t7y5op/tCr77ZODQ/9FmL4WWmqQIplv40OPa
         d9fFTcg9BOGx4LZALgs7U1vse7+q6LSMOzQTKVasR1dleEvAKvXd8iwlMxGG+2gLwNjm
         QEkw==
X-Forwarded-Encrypted: i=1; AJvYcCWG4ut38/RX8RIekyvM1gnvbsXrLJtZiRQ1DJ44y+OeDn92nYpfSUFNb5AN/mmrvVUdnwg6eU90Z4bO@vger.kernel.org, AJvYcCXxbhqp9XIhr/tmS+45BlK/h15uEwnJiut7l4btDRTCLODAmgEp221CJ+yFnzyYpSNAfA5CLOjkRYRMSXNU@vger.kernel.org
X-Gm-Message-State: AOJu0YyIY01zi+5l4JetQo3EcZRnW0MLJOtD3DJYrw4U22SJatG5jwxz
	/p51nPG2JfXGRvDZ10eKkXDszxWMoW8AiPkxHzH22p6fwsUehNCc
X-Gm-Gg: ASbGncu9M2wUpKUxIR2mrz0pR8qoiA3rneszJD4BBDXwc+EoE3SSC6qLph8cGyzFZpM
	uZ8FUR4jU86tPAHhF81q0KBmaeP4bqYWYig4F8nPUSfzzYMcr/AspTsUb8GmAQmOfTVhSR1oEEc
	qS4LXqRotfiGZONa7S+LH/kRCvjuk6X5++S7tnAD1tkCCC417RhJCgyixqGf1pOL3I9d7IVoA3F
	aUhKN+BJS8euTCF9liCienp2nZITGzAvu+eZCVVQSABc4Cw7J73ydxb7jJTMukgCXxldQ81VOo7
	yaC+S6r4cvwaqEtx+qcSp0E88AAiF3FIgk67Bifm9aH4uYS6O4EFsvx6/tiLXh3BQUzw9aOk02x
	rngOLk6DinzvHIY+ERFfTcDq5nsiYvt/7
X-Google-Smtp-Source: AGHT+IFFNwZuzPpcgXu3kBDtlZM8MMqYF6bESV7jDqgOq+SzmMpJ61BfMt+aYVq4BlEH8Tzb0P3QQg==
X-Received: by 2002:a05:6512:10d1:b0:54d:6a89:8725 with SMTP id 2adb3069b0e04-54fb4aa0f95mr1077123e87.48.1746541798584;
        Tue, 06 May 2025 07:29:58 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee2f9sm2080641e87.108.2025.05.06.07.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:29:58 -0700 (PDT)
Message-ID: <57fb3864-51f1-45b4-a16a-be67e3a1451c@gmail.com>
Date: Tue, 6 May 2025 17:29:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Immutable branch between MFD and Regulator due for the
 v6.16 merge window
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1744090658.git.mazziesaccount@gmail.com>
 <20250502074743.GC3865826@google.com>
 <aBVUTvVnfuLFxzh4@finisterre.sirena.org.uk>
 <CANhJrGPMhRy4TW_JMZ8dkgdctgF3f+bAsoWLkrNvqbcbc412WA@mail.gmail.com>
 <aBoYYrfANv8QLfWA@finisterre.sirena.org.uk>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <aBoYYrfANv8QLfWA@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 17:10, Mark Brown wrote:
> On Tue, May 06, 2025 at 08:28:33AM +0300, Matti Vaittinen wrote:
>> la 3.5.2025 klo 2.25 Mark Brown (broonie@kernel.org) kirjoitti:
> 
>>>> are available in the Git repository at:
> 
>>>>    ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16
> 
>>> You need to specify a separate url and pushurl for the git remote so git
>>> generates PRs with a public URL people can use.
> 
>> I didn't spot this in regulator/for-next. Is the URL sorted? I'd love
>> to see this merged...
> 
> I've not seen any updates, you can infer the URL by hand if needed:
> 
>     s,ssh://git@gitolite,https://git,
> 
> should do it so
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-regulator-v6.16
> 
> I generally don't actually pull these unless there's a dependency
> materialises, especially if I'd have to fight with my tooling for pull
> requests a bit.  If you've got a dependency then send it and mention the
> dependency in your cover letter.

Thanks for the explanation Mark. There should be no dependencies I'm 
aware of. I just assumed you'd pull it from MFD to regulator to catch 
any potential conflicts early.

It's all good for me for as long as the series gets to the rc1. I just, 
for some reason, thought that these changes are required to go via the 
regulator tree.

Sorry for the noise.

Yours,
	-- Matti
