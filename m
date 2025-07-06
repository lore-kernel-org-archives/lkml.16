Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C6E20469E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751797672; cv=none; b=XZsYQ1NYFp8GGOR0RQqRrYLMbm9R8RpgO5q0r9vSCTObOluPIv53712cxktSQ6A1zz3RTmfYaeNA6Hsl/sgTA2GBhB4TRIIezKsgj1khExRLPSsPhd9dRxQQeC/+cwyPniHYDhcFkVCkskYZtGzxOwbjeK7EHvD5jskp7hiOpkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751797672; c=relaxed/simple;
	bh=2g8kSUiIHpNjcwDQNc+mUbHkCFwrkEz6nPjIdcGB60w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzvtST+NfD15LSkeM+3BtWBvvSHUlh2tt0ehDnhSUr7etwLyYhyD9HuP5BPYkb5CwSwQ/YjB61V1dhtCNsRa3Z3+VNYmoq4CzNwpD0zH/K9icEjvfBLx5Fk894tC812TpFap4Xb+lXXofy2uynGrf6eDdHEas3HHHcPKK9v2h7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-531426c7139so742900e0c.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751797670; x=1752402470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KLgEzvYGm6L4rmt4C8LTf98kXe3XnNFl/EVyq0r1SVI=;
        b=N01OCi9oINIBx2PIQJwGyM467aa5r6AWBykbRlhJh/Sor3zIuFrvtqxcX4+x7xap8k
         KVXQpyp1dcIsMNyEwi/nHdDsc76jwRa9Zz+DpbW3O3f30MCfLhfigT0WBXyeAbJroeWA
         3BLsuVrSGh8jLNyz9JNHz0I4Z2CaBmTs/VuwtipB833qY71FOwVt++PfwqhhSElzSlsg
         m6YHe14A6HuyMBbP8gajUbKX8wOBNBcOt0griRZJFo81J1kzP4WQWIwZ4Mr6t1DYVQJq
         a4s4UdpFuJFPGe2oH8rNof3YlF546ZhO3MI3vx7Tca94yCDEx1bvLW2Re16boP6NUtXO
         gt3A==
X-Forwarded-Encrypted: i=1; AJvYcCXtLgQbrKXaTNi/At2Bgj0nsCUSOW9YzJHrxbVy/0jh/BbL7sbVuElk4ThQ5UfKETGYe4E6SFfWshJKlIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymj9xGhEJHkFKrjF/NTJAXo8Bkut4+9Q/gtl50inWyoMS9ptwR
	990h59n6TCrOrOF1suJj1IvaX3KT6vF7BsIongdtMHBNSuZcCCsLDhXnZjedc5zw
X-Gm-Gg: ASbGncs3UsmSqAIWLJnsBzomgDDr6CfUlj/MV2gX1Bas5ANtVKIFvGHeFFQWDZzAMsR
	J6m1d2Mwu1xoZ5yyiz9pobBzRKWJ03vGvGDxNpNGCVcAQt9wt8gIrp5TT009ut4N98ScGDyiHAa
	P6yg0LsQFOX26+173z3/nalvTmiCKrYG1jRf/kUYPBoW+f/ePvnj73llXMz/8d3dgP8gQ2ZWu6e
	lM2Ea41j096JfzpUuXD/CKxsFJ1o9gBjt3uAZCPvaJnWXlGhtA0Wh4yofUp+Bk+xkFSgSeoBuLX
	7jTvDsC7ALUfXPgmg+xHDvtPqWDy3vbjSgtThik3BkhWTqeS0l+0w5esDVTwL/diyGYxrCi8PeP
	lFqFBfyWAGV5VZk593S+tGXfo
X-Google-Smtp-Source: AGHT+IG/zQ6S+Ocftndsjkt3dY2dD9RGJ4VC34ug++N8yNSwHtO8NGfBrrx3GQqNoDY8yQ1Cas3OVQ==
X-Received: by 2002:a05:6122:3b8c:b0:531:2afc:4637 with SMTP id 71dfb90a1353d-5347e8698f0mr5153096e0c.9.1751797669614;
        Sun, 06 Jul 2025 03:27:49 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53478da53a4sm880373e0c.2.2025.07.06.03.27.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:27:49 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87ec5e1cd4aso796525241.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUz9wSjLF1NRbD7eQtTqy2igVlqUfV9taSwhJheFAJXekKiV0oZa4vp/s9Eg6FKVRfaZiOc7K3tCb11M7I=@vger.kernel.org
X-Received: by 2002:a67:e7c7:0:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4f2f24090bbmr4565683137.22.1751797669139; Sun, 06 Jul 2025
 03:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743115195.git.fthain@linux-m68k.org> <a6104f41918bed4fd17f92c45df94ac7a5d30e40.1743115195.git.fthain@linux-m68k.org>
In-Reply-To: <a6104f41918bed4fd17f92c45df94ac7a5d30e40.1743115195.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:27:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdbLz=x_ocZUuPisoYkpUB20VH7+1K5tAdVDcAhGvZyQ@mail.gmail.com>
X-Gm-Features: Ac12FXxnUkuRS3r_XQ2wOa10mggRqlBnJa5FwZOMGjdf7Fcg2tbUiUvcabTIQME
Message-ID: <CAMuHMdXdbLz=x_ocZUuPisoYkpUB20VH7+1K5tAdVDcAhGvZyQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] m68k: Avoid pointless recursion in debug console rendering
To: Finn Thain <fthain@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 23:44, Finn Thain <fthain@linux-m68k.org> wrote:
> The recursive call to console_putc to effect a carriage return is
> needlessly slow and complicated. Instead, just clear the column counter
> directly. Setup %a0 earlier to avoid a repeated comparison.
>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
