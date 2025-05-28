Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E81274FE5;
	Wed, 28 May 2025 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422502; cv=none; b=AjdqUBt0/qr2GdXCOpCdDRGzDTlvFA9JQ9e8UV7cA0Sfa0bxuGteQqsbvswySdaVXaEnKQp0LnMpX2FhLP7TUUoulRHCDUWJDStQwNHVVY2VPn3Hek+oWVo6u9j++Ddrn4uQqBRn2eqcNBxbtmG1CfTHNs/+RAgkkjtwCrRFa38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422502; c=relaxed/simple;
	bh=UVux7hP9bMnrn8D/4/hQlg1HOvWZ0FYr+0n+VvHDd6g=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D70w4foxOKUbANuQeU3BpN2gh8ekDDpfbkioTEjN2pBNmUhjuIJ9+knK83V6n3CfjEfuGuAL6jMjg426uz5YLYdhATD1qc9x+hQ79zoj6SC7TUY6lYXSO4793hpGWWIJfVlPmdVi63lGv9v2wBTIcKXmVDCeyKXA4n4V5HnTDYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZwMkE3w; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZwMkE3w"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442fda876a6so39920375e9.0;
        Wed, 28 May 2025 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748422499; x=1749027299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X4jr0jEwV3YNS8f7iVKb2L3Icr+a8dnf2UQtf6f1As8=;
        b=OZwMkE3w5p3YquP5bfzqj05sMAwlSZE8M6Ng46nz4dMYnFhGl2QieMKnSAYB/x8N4P
         xN3kbMRbMiKMo8N66gxbLfWRlXgVcnn3BsJttC0FBBNyDIgx8o4YDbkrjJ7j7Mf6aYXn
         XSrrY/1vLZc4HQhs4oLKiWCEX2T2IMq2ryiWxMEOoqjPJ845XvZ7ppyOqC1/qFjNG5Pp
         tssh/QiRIiyXSuKmTjQUiRJKzhMJ+zATY/SKRcEYEGTQnVIc8wwQLdNWmwpKl1hkDDm6
         MBXoO9hJ22lDhBgROwmRaAST2I5e79ZcDOHs4JbmbqhKGwHDRRc6pzHqEiCrUDTlDaeH
         l85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422499; x=1749027299;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4jr0jEwV3YNS8f7iVKb2L3Icr+a8dnf2UQtf6f1As8=;
        b=JG3kDHDvarRFDkQKGdEb0MMtGzmxe5U8VfN/7kFbXB2zgo9FZCGMcp4O/6VQw15dv5
         MeOZAomXorIF0vC99Pc1Xg3OZlquRQhExozAUBEdndDk0us0rQLJFNSaa+OqFEwZsN3u
         1tFCOqSa5+JulYprgoxoGDZjXBUCL0lk5uxU8bU7hVS/0m7YjAwbltOQ52rWg9LVqCXz
         uA2mdmUkIuK0VCj3UQZS3I5MKcs/oOsdQn4BiVdG8mLSczIAnU/fMXNvGSLTV+ZXjska
         /I8hOyt/1a2kXW0eVk994haJD+T1N6ZOqCUFtNfrPu0vvAU6y+FzjFvvdvggtUXHP/MX
         kg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvD8yfp3M6xbBkmIyHPw7ieDz9rf6ttHf2POUjIphl6392WZCEh+svp55uL9q/RRrBt91uesLv4HKdN6nW@vger.kernel.org, AJvYcCW4nZ+PV1cpT4/DmcZVGyDdEgXvTPzE7478xhLRTPooX7Qmihbwm+tbGf0lMsoC9PJoutrh/9jIJhl0@vger.kernel.org, AJvYcCXIjQcI3I2bOoKTEnQqZJ40iyjXcRguR6nOj0EyvCaPBSq6biiexVkB3X6CHbhtqqK+LAZ1qo2RMDb3@vger.kernel.org
X-Gm-Message-State: AOJu0YwMTIuy+tC++VQzkHgynsk4s6MHs0kKnXp1ZcnnH+9KCF4+lxGf
	Sp6sdaGK+fU6g0WIBaaI8KMdA99PM1gKCiZQASNXyEwo45nFogTrB4XS
X-Gm-Gg: ASbGncurlSckx7Elp+9oAxDMOoKPMcz7tCye37ICOe0iZJ39P3UObhnG6FkFgKIvUjX
	R+D39VbZGEAyEtS0JqaoDkRrtC3XnTvbCu5+/5w1C1hz+JdFUyBHtY4E0+8r5/+KjrpEAXej176
	hp9eDjQecezMsEWzKF/6l38V4VRW6jJTKSrZfw1cvLKrEroH8ccADRZdh/kCNQpbiVNyuinclul
	GWVStNZy2WJtCM0ZWRq93tXVFrkG6qkuJoXOr6jPDJnjwGzYulhgi0shWViYbYNv7cbs/onAKRL
	HhHNWv2B+1QzBdgfRw6Z2ra/NUVzJpR9ZRivKwJEQXtyVdITJ9AFDu6pk8iOd0LrETkDkIwVnD7
	0eJjk/K8=
X-Google-Smtp-Source: AGHT+IHzDXo4DKV7NuIB2FHat2ZLCgGieMqt3tp4PCcFaDmAJxHMEYrCP10nDJxLNZ8k0RrjjTbMcg==
X-Received: by 2002:a05:600c:511d:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-44c91cc5591mr137161785e9.11.1748422498857;
        Wed, 28 May 2025 01:54:58 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eacd6e8asm865113f8f.70.2025.05.28.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:54:58 -0700 (PDT)
Message-ID: <6836cf62.5d0a0220.35d0aa.2025@mx.google.com>
X-Google-Original-Message-ID: <aDbPYDACfIkaZMLj@Ansuel-XPS.>
Date: Wed, 28 May 2025 10:54:56 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: clock: airoha: Document support for
 AN7583 clock
References: <20250528004924.19970-1-ansuelsmth@gmail.com>
 <20250528004924.19970-5-ansuelsmth@gmail.com>
 <f9aebfb8-6312-45db-be12-94580ad412cb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9aebfb8-6312-45db-be12-94580ad412cb@kernel.org>

On Wed, May 28, 2025 at 09:30:37AM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2025 02:49, Christian Marangi wrote:
> >    - if:
> >        properties:
> >          compatible:
> > @@ -75,6 +78,17 @@ allOf:
> >          reg:
> >            maxItems: 1
> >  
> > +      required:
> > +        - reg
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: airoha,an7583-clock
> > +    then:
> > +      properties:
> > +        reg: false
> 
> 
> No resources here, so this should be part of parent node.
> 

Ok hope you can help here. This is another case of "MFD" thing.

I was with the idea that it was O.K. to use this with very different
devices. (current scenario Clock controller and MDIO controller)

The node structure I had in mind was

		system-controller@1fa20000 {
			compatible = "airoha,an7583-scu", "syscon", "simple-mfd";
			reg = <0x0 0x1fb00000 0x0 0x970>;

			scuclk: scuclk {
				compatible = "airoha,an7583-clock";
				#clock-cells = <1>;
				#reset-cells = <1>;
			};

			mdio {
				compatible = "airoha,an7583-mdio";
				#address-cells = <1>;
				#size-cells = <0>;

				mdio_0: bus@0 {
					reg = <0>;
					resets = <&scuclk AN7583_MDIO0>;
				};

				mdio_1: bus@1 {
					reg = <1>;
					resets = <&scuclk AN7583_MDIO1>;
				};
			};
		};

But you want

system-controller@1fa20000 {
        compatible = "airoha,an7583-scu", "syscon";
        reg = <0x0 0x1fb00000 0x0 0x970>;

        #clock-cells = <1>;
        #reset-cells = <1>;

        mdio_0: bus@0 {
                reg = <0>;
                resets = <&scuclk AN7583_MDIO0>;
        };

        mdio_1: bus@1 {
                reg = <1>;
                resets = <&scuclk AN7583_MDIO1>;
        };
};

Again sorry if this question keeps coming around and I can totally
understand if you are getting annoyed by this. The reason I always ask
this is because it's a total PAIN to implement this with the driver
structure due to the old "simple-mfd" model.

(as again putting everything in a single node conflicts with the OF
principle of autoprobing stuff with compatible property)

-- 
	Ansuel
