Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1D7154C00
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041921; cv=none; b=jlzlA6N66BxIWmphyhrZafHFPQJypxSl+/Oj73kuLFcTs/CWjv914BdSSE8ZM0EG/e67Wmv2I3yPD6nyMWBtGNtzDSAdDhkVoIMh9t5LwHwPPwjoagN+aBUeV/x1+LppOreX8M8AxZYgMlgQboNXvkl3A8mGThL4wSaWNaJpCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041921; c=relaxed/simple;
	bh=u0aF0vd4QcjvPIuR0+km623x+V7ksr6MnKsaPN/8+xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyhxQZi/MLw7WJO8PsZLK3ILjXBbxKATY+Ott/lUyhvp3gtD2AXTCRwBfH5QIqZhqvxbBj8WP2YO21dVO4bnvzX2odTjirg8zvjHlzHw7XmZbRZt3CH9oZEFm++tATGivKFFxErNjrI6/3wSdeAnnxwePc5grZwrOB45uzm/H8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPVF7zbe; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPVF7zbe"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e63504bedd0so3387258276.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744041918; x=1744646718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sIltRROPIS1IFEA+sscZBf150A68RCMQ2MklOTTVcXo=;
        b=DPVF7zbeZiok+kLrcO1mMH5DVBDyne3+gv1n9v70X32P+npah5RaGGrQQ4Xmv7MrCS
         r0vXD5SL6nF78IAwk9X8voAEtQh/oYeXNItxXIpCQlnpn0L81ZrIP2MBeloBUfzWcbvz
         jFIVwhc5u8zefr4AyHn5atFJiSVu+E+8/0oru43HXp/tY9m7lxqFlohmncelf4Bb1jfe
         iTtHeUHbyMxqAbClhlyatFHyO3E7IFW+AJpZlVlxaf2pPtf9fOqeYyzfSMGhXKjNq9iv
         W24wDbL0kK4UKLYZHj5l7MOcPwNxb0vGdiCFqopfl8Q+gAXT6o6TtOFF/TmJ/DVBhD2w
         VUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041918; x=1744646718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIltRROPIS1IFEA+sscZBf150A68RCMQ2MklOTTVcXo=;
        b=Wdxp0H57uzpfhGLVpxvEm/ixypshW1zjYaDPzZZnqGGgWuw1ZVn8jTPnWlV6CNI3dc
         Ec/yYH0YoNhUXzp6c6deTjK0qBQLg7aa6QxDsg3ZSp5pqt7gJ02fYulPeCEseg762UEG
         6RvYAVFbO4WAfVCQOe1Vkr7GavGZYki5H93afOhySQn/AepmqN8gx3J27BgskAnlpqur
         7JrpdDxPYl/IHHTA3jRGDKPlbbys14Snpk+1PYQtmj4hGC2zbq87Gc3nVx+G+hZEQDyU
         H3vwDAK2gKFjNtSwvwj6xoDj8tBUhO//lsmAZoKOYj3SUJea8kaL9jQUvAcyY/0J6Mos
         QpUg==
X-Forwarded-Encrypted: i=1; AJvYcCVa6vqiWfRjcO4iTsoOP+we2TWCF1FHjfjfHHhhLBb7nIQEjceowu52uuVO4DG2ye8r71l5wiJTPfwwxcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7jivlpqswQHe9TgGJHTXpa4wvVKCcM1stV//TkARpJc0YBKwo
	0ZreRjGEb7y4nSLto+LfqTKbvWDSkd9VRu2X+U/HF6NxZTd6nBfw8T1OTkDLj9TQwp9v3CTg5d3
	Sp7CmhPzSXJylt0b+CvFgl6SAOXaFK8ga6a12bg==
X-Gm-Gg: ASbGncu8g7jR5zzqDosuBrf7DwWRuLGEVfch6NZd/bQx06UGffPYHs9RG3oilEnAOFL
	KRkjAWUktfeiUJprEJQ10QvOZ6jcdpPXagcHRtmRNrYlvgXxiq/Bhx2qWiCtKIgfVRj1jblVk9f
	+aops9qilza0wH2i4AhAOSXGntJJc=
X-Google-Smtp-Source: AGHT+IHfemisUrYTSu+R+ITsGXJEjJhr5usaC/eR6dHy88Fr/iGTY4qDERK1sHs9feVLfrvg0UHQslChxfDxU3tm638=
X-Received: by 2002:a05:690c:630a:b0:702:46a3:4721 with SMTP id
 00721157ae682-703e153033amr248995447b3.15.1744041918403; Mon, 07 Apr 2025
 09:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250326143945.82142-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:04:42 +0200
X-Gm-Features: ATxdqUFP_RvU6m6--vLVjW3iZgEwByAoHi4eONoRyG_VyZwI9qdEZYqg6kr0NJo
Message-ID: <CAPDyKFrCy-rWeYz3qoRsTQkw+PY3e7=zGUN==4U5_8FvdHezGQ@mail.gmail.com>
Subject: Re: [PATCH 07/15] dt-bindings: mmc: renesas,sdhi: Document RZ/V2N support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

- trimmed cc-list

On Wed, 26 Mar 2025 at 15:40, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add SDHI bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC. Use
> `renesas,sdhi-r9a09g057` as a fallback since the SD/MMC block on
> RZ/V2N is identical to the one on RZ/V2H(P), allowing reuse of the
> existing driver without modifications.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 773baa6c2656..7563623876fc 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -69,7 +69,9 @@ properties:
>                - renesas,sdhi-r9a09g011 # RZ/V2M
>            - const: renesas,rzg2l-sdhi
>        - items:
> -          - const: renesas,sdhi-r9a09g047 # RZ/G3E
> +          - enum:
> +              - renesas,sdhi-r9a09g047 # RZ/G3E
> +              - renesas,sdhi-r9a09g056 # RZ/V2N
>            - const: renesas,sdhi-r9a09g057 # RZ/V2H(P)
>
>    reg:
> --
> 2.49.0
>
