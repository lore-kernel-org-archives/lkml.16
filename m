Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF53198E60
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753242; cv=none; b=pDef8Ian+GVdlLZXXIW+RhNKrknQcV2sL7nzRLnbvltjhWkvfHBCOanqPdvfXE/qKawUcvXekuBuCh3Zq1rjF0AS6YxI835BeFMhSgaSdP2DQu9N9GpjiZVTiciyqIL472Pxmm2wex4Mta6egN0zWbnZtu3U+B3H0a9A/o+i3g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753242; c=relaxed/simple;
	bh=eMOboR1OF7sgHodBKX1sm5CBlNgK4lAffdjRbbeWCqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfEM1/BWe/Dpw8BdQwawf9csbu97qzipw8Qkp5Z4Gxucb8XrJkeqlN6AietB7aBsLl+7Asu5SXMXHpeKJ4eqvEezj0/g4Ymo06ZJ3KE7ig9FVqGJwK15lv3nlKGGHnmHnxOKX1/AE59f7raceU61zOuYBS0HVvmayUhSZkO6c84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XesQvbb6; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XesQvbb6"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac25d2b2354so304107166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743753239; x=1744358039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaGTQLiNqEVn6hoJZLsfuhUQi5LJ3xyfMo/qxpq0bPs=;
        b=XesQvbb6uoPiMNFvnI0BLKf+rzX1q6cPpJgLQlCLBQ5nq6gBwKVS10UI4GpysdCwy0
         WTOR7FznWpUltWiGrTpILyMkwYXCuYOuFy5kK2BhUpT2L3reYzY0FA1sB/oZvZl7xhmb
         uSN2oJhkbyZt5m6a4Ssid6XM0lMDHOwJmFPdkiX1H6+nXqpSMYWIeZ9O2GqNNOlsMeQk
         a7XYCXNWOow6L4FfbdOiITsrex5BWTLgKMpKeFxxxsIzP7XU5s6LJb1N+C/LKFD0ZFEM
         C1tqTLoBX14CvesGnaMkRajp4/SCHbEFH1ccP86VkOXdFd6XA/z8MV8wYWag27+ZaInC
         UCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753239; x=1744358039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RaGTQLiNqEVn6hoJZLsfuhUQi5LJ3xyfMo/qxpq0bPs=;
        b=q7Gz4vnmatgXT8r09Jbz6VBZbSX+C9m12DubmIIfAUjoAPMA9WDpDpaAwnyDyNXXwQ
         GEYbcuFg+d2sMh6siYu+rO5y4d0/Jq6TkyCHHWPUN3Va4PU5rIPxrtno3S1frQw8pYCD
         iLsQFT+ZO89xhX+oB0dYBslgsJiprP3J1OAFl98ZDfxM9ArzYu/BpqLFkg8pSZ5jY9Jy
         ul+d17wUJ2XbKit2bLGEGrbp/rOynqbVgWzMRToInH2dgnKHPjotGnzYefFn7USYQ6rv
         uCC10YdEem8Uu2Ye63jSvCqZd/OPjP0TAMhEtvxQ1VGyDuRM62+w3RoPVt/bU+Eqved/
         aenA==
X-Forwarded-Encrypted: i=1; AJvYcCWff8UHYTv3w9jfao+KvJw0YkPZJCyZtwIcsbE+24Pa0vjESnnMqKxGrrCOFT48p3cV+SIMEA6gJCtk0Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDTeZLQmm/CM7dJ4XwOEszNXfmZrcTiuXBlTlKVqOaAx7gti50
	IeYXcixt7Q84JutCaZKvcc1IlhvMQUv3rIhOnXR54qJRTACkWEIx7xzP9pH/NnmJSYcfifZ+2Hk
	H21OBN60DRHyLy5eijBBa74716O4=
X-Gm-Gg: ASbGnctApdjIjro1RqLnXNQ5UJ5LDf6ehGlaYSSB0EyfUMBQfdMCM1HGpk4T8k70F5n
	0hMbnDmzR2Mh9nEFL785hegyGlpimxtu1ywI9lHQwxlhvuJkfEK4J9AMireEuaze2M7bYBbUGEe
	vlpPM+SQHeN05qYFLtoVzN2BBPFw==
X-Google-Smtp-Source: AGHT+IF6civQrpcsNGh3qPt0iFr0ZsF9o9HE36peO/Ap6sGq0saiZ3ABHJ4gFSQo6erdYgpt1gMsmjYQr107nKWDgTQ=
X-Received: by 2002:a17:907:3686:b0:ac7:31d5:20de with SMTP id
 a640c23a62f3a-ac7d6e93527mr121032066b.50.1743753239033; Fri, 04 Apr 2025
 00:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com> <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
In-Reply-To: <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Apr 2025 10:53:22 +0300
X-Gm-Features: AQ5f1JrSo785G3atwbFfwkCZQrH7Nn1tO8h4kPi_a_CCxGgfg4kfie2vKhwpsQw
Message-ID: <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
<abrahamadekunle50@gmail.com> wrote:
>
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
>
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
>
> Found by Coccinelle.

...

> +                       psta->sta_xmitpriv.txseq_tid[pattrib->priority] &=
=3D 0xFFF;

> +                                       psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
> +                                               (tx_seq + 1) & 0xfff;

> +                                       psta->BA_starting_seqctrl[pattrib=
->priority & 0x0f] =3D
> +                                               (pattrib->seqnum + 1) % 4=
096;

Logically it's obvious that you need to align all cases to have
consistent approach.
Besides that the commit message should mention this change. Something like =
this
"While at it, convert '& 0xfff' cases to use modulo operator and
decimal number to make the upper limit visible and clear what the
semantic of it is."

--=20
With Best Regards,
Andy Shevchenko
