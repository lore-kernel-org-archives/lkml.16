Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9258D26AFB;
	Tue, 13 May 2025 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122240; cv=none; b=DClyPAWggFEjyhvmI31AbIRd6I/30x6TFyebRaiLFic2Ed7Sf3ymjau33j4ot+D5pLLhGOB7Qyg21u23BPkvLzNxxXg7Nc79y/g0AguPQ3zZr97KtD1kp8Pk66f+M2WxJHFEmrtOTgyQg2IOh4tdA6KIkWSpGMeh9hJBbnAyUq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122240; c=relaxed/simple;
	bh=h++75clzys47eBFuF7l+Mxc5y6MYCu91Gsf4i1cCO3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4XHoQS+T+Xjwiuad5xBWw5/RacF0zgSX/q/7CjcvvQUUWCTvg7+TaeE0fEffTplEc6GTtnd3DxVa/HYvf/p/l3TnZZO6vKosi6gg+vErUNx2eHDTHdNbUMC+x5GyHENkz0JYtql/bsxO+losxh/k1MAsmjDK8gzfy3Zu3n4qOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4c4e1f16833so1854556137.0;
        Tue, 13 May 2025 00:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122236; x=1747727036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9px7yMYPHcOtAwKGdYxPAkCFxVsMD5aB3ekj+hfP2Uk=;
        b=cvDrzkcXgef9fSW24AH969NHvAVzaN/yRZO23Tnv7CGiqn1mE9CjNoxQs5Q9xnOmuC
         qef7kfSVwj5hkBq1HSZmmT/TWJttehO2KtjXrAPuw2Hq4qGtWgk5IJMpT2855wxTKJ3L
         Qbc2Xuu7JJ8MsAHI1PH0JO1b6CVFSjJSgvG3uiIUlw+8ZHro8WcBVySxM87Ho/4fmqRM
         BkMlkvEWjXVQ0p6gtqxIUDk1odQIOp8EpYG1qucc0z2IzvN4jMnqmzPMSQpU/aIhX2Fx
         Ri5NcHvj39u1BLj36ZsDW2cnBcoXdZ6fHtqnuzUepa0FiTsAT0uy4awuca117BsCTSPs
         BSjA==
X-Forwarded-Encrypted: i=1; AJvYcCUNGbn541IBIfCH+bLAacu9GVpiKVp3GO7Sx+Xd2epJwCUEou1K1bErcHxFSH7yKOrvnCNAWdeTYKS4@vger.kernel.org, AJvYcCVWXdKCnnE6dtTewAyYODPhVXr+NRZO3cISJFuZAivIWUnJM6HNcqktP5o6mI78v4OLDoazdHkg2Wy6merx@vger.kernel.org
X-Gm-Message-State: AOJu0YwMbaF8b3BU9wBBqQMPDm/FiFqA62bN+cwAApNuJqosBhX/mawy
	K2qcUugVYNXltklR5zq7Tz4Mek+p9dwAOje7KSilhC6PX0tYr1HQE8n4o27u
X-Gm-Gg: ASbGnct4Y4LhSG6uxEAVksq4FaJ2pn38D5dVgehGCl2af0BWnaKNvy/fGyb+LpV4SHl
	lhE85cPjn40taEee7QecWyTRoz4hBM0qJ7+adCWnXqksbSPkXCqmcNxf0k+xMEwQfQbiYLT7Ss2
	CObzwU0vVvoQJrPQ0svpVnAFrRSKJGD36fI0NnQfnZQFo1HQKiWxo9AMz9SjO5fO/FOH1M0pR99
	8PUD8bhaF9BHhA6WTMlLkYMfRauXwJstF+dlIYK4xadCy90Z1R/3FcQqCQBjy4ngQTZ6CeuJdgT
	PR8OxI112HUOvoYaWGKA02v+Ay0maDQsO8jvEZqlAVP7364ZMLVUROUsy06fcOvgUPFksqxcIYz
	yDkgcwoFaEJHCZd9HcnHx9A7E
X-Google-Smtp-Source: AGHT+IF5oPBPBEvlNoqyJYbAhnk8fbdWqmhquvqSousCX257tzKjtek26LgmbTqOxgk974FKBZtdAg==
X-Received: by 2002:a05:6102:2b8e:b0:4c2:20d3:a125 with SMTP id ada2fe7eead31-4deed33cf89mr13508003137.8.1747122236468;
        Tue, 13 May 2025 00:43:56 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4df3fe369b7sm4672333137.16.2025.05.13.00.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 00:43:56 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso1331293241.2;
        Tue, 13 May 2025 00:43:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMLev7BDy3hwZP/hb0Iz98agPHPB2WdA1m0MNWh9/S+fuVU02NKcslbj0OjrSqLJq+Qz+iilDt8NRX@vger.kernel.org, AJvYcCVy4b10Vdow+YjsPqc7eTYMILn4MA4Fc2SmdvA2KNg7ZzSD5NP7yycATvJAqfOw350RH8ui9w9W75Fbbwfy@vger.kernel.org
X-Received: by 2002:a05:6102:91a:b0:4da:e6e9:1f56 with SMTP id
 ada2fe7eead31-4deed3e926dmr12879431137.23.1747122235875; Tue, 13 May 2025
 00:43:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505144809.1291619-1-robh@kernel.org>
In-Reply-To: <20250505144809.1291619-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 09:43:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWncKNK6PWckippu69MBhLq+zACbEbfowkWfTK7M2_q_g@mail.gmail.com>
X-Gm-Features: AX0GCFujJPju3_lxCoE4JcDCtIZA51Q7ofr6KjChwZUjyBr-akmvlJ7H2HyD46c
Message-ID: <CAMuHMdWncKNK6PWckippu69MBhLq+zACbEbfowkWfTK7M2_q_g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert chrp,open-pic
 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Mon, 5 May 2025 at 16:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> Convert the Open PIC interrupt controller binding to schema format.
>
> While the Linux kernel supports the "open-pic" compatible, that's not
> used in any upstream .dts file. It used for "device_type" though. Add
> "fsl,mpic" compatible which was not documented.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks for your patch, which is now commit 45168cd2df5019cf
("dt-bindings: interrupt-controller: Convert chrp,open-pic to DT
schema") in dt-rh/for-next.

FTR, the real Open Firmware in CHRP LongTail also used the full
"chrp,open-pic" compatible value.
http://g33rt.be/migrated/Linux/PPC/pci/mac-ioAT2/open-picAT40000/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
