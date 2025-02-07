Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDD51624ED
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923378; cv=none; b=SqgHwM9CUzoOFpBsImk+xtWxL/DYXW7Ou74UFXiL2VyIPyG+zgPiATFjtOjwh9EgLvQGcESILiJ4apbqiOdKd5hH5R6kvublv/wWbAdu0vb8FBehq80mNab9j79gRTeh3dGRpf36o27QDZOq9xYBKtFybKsi1j7o4qz5IOQqr7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923378; c=relaxed/simple;
	bh=mdTv+QVDXPvlalZfbkGNrgsBW9vvfsm7zTp0oVSmMP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XjtWc68wcKCIb3c3eXW3uEVBpeJr3Ydl6rVOuw5mX+3HeAzLLn/0k2yHf5s66buDsgcNQqMXsQK7m4U5XJtqZIsQKxA9IvGX/yyG8OFO3IscuBFs1zygZOylRBIJN6d+jGPW0k+gZRt4DlzhS3agey02+HJ2fADCw28HBw1Hakw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oQPa2Dl/; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oQPa2Dl/"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4678c9310afso191211cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738923376; x=1739528176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kCUV7x43bWbCI/hcabQDWCnrCITBo3VvJAZs4rie/Wo=;
        b=oQPa2Dl//chZZlFgaQLXcSl7NGGC5z7c5+FFfC/Gl0sZNbPunGcPm5ezCaNiR+nLN+
         EGvZSlR+xulUBAZXU4CXXgVUEcRiAXfxcIyLkSqvQIHs/4Qff8XbUMsmeSfJbIfBq0oy
         vZ5oqZ4xW7zHm5qKOO6e9YXBuxj6nNvJHhuKBXvU/1ycwvMscKRFmzL+AxRa+OxtkBel
         A7iFpBUBVuz5S5NqDVWZayjeqNQJQRd8yZFJX86ncAW4K7plhkBJNpLZvq4QA5S7eOUU
         vQr+lYx9npNYP7Q9l40ZieGUv4+47KBz2knQJn/9vpN1mrPrzT7NVAT2TYjGFXlk6IH9
         QwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738923376; x=1739528176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCUV7x43bWbCI/hcabQDWCnrCITBo3VvJAZs4rie/Wo=;
        b=kr9rjKWRgKAvnClsX++geFeEoZTQQtttCxZSwRgSR+xL9l0HD7HeA0fKzJEFp3ksvC
         m4S4oX+dzat48ttY3OEGyG/QPs4rhNtFiab/98Vg09LlSPX14plpvySCbQ1IbJ3G32u8
         A9Q18msMYuQ3IEZ6oErIMAL/mVP1ix2MDLDIepHHlveUKDOYJXtl4ZdcS5UBI2gx5aCD
         smD582r+W1Fa96rzg2FWlAdsvM1XZX/KrRcbbrm7NZLxw/T9nCF8iSyFCUoUvLvh8vO/
         y5RV/grig/rwxyS/3FvvJXaaX+bKNzteSKytlBpKPrqGRecRhdhPbJEtFEFhGy5oCPnC
         z4mA==
X-Forwarded-Encrypted: i=1; AJvYcCWSVuUGOiPsZiGP1s7raPuRaD3D27B06CgXBPlweov/S/o0y71WHqfw/m+1l9CDAyN1+Xtq6vsQpQjQXTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9Nfz7CNqyTVA6Y9hvl/3bSKEy35QRbzVX7zkLeJ0YMjQYT+C
	ZmgGKpYLZwXsvXDbgARlppfNCVr7XM5lAI3AZ3hiERL0UWM8YzMOtQIqjqivU03jcqEoQzOrWQZ
	eHvMwdxakKC/v2Tkd34MQX/hbz27PFdooe+Sq
X-Gm-Gg: ASbGnct7BqrfUeeUkKWVBN45gPGPW+/2yIdB8/JKljsTx2nQFJW6QkWGKodANdsS491
	8wc38dTCk+sbUQhplYgbw4x9L9QjLTodAyx7myoZw2HDHUO2TEY4/2LPJ2tkb6jyb4V95hB4HxZ
	5UmQJRMEBKvGC1ehnrBrriF0QwQ8w=
X-Google-Smtp-Source: AGHT+IGNBzvSf6Dx7xTDH8RzZIZRJ/MfxFXjZEpoZFDY8zOeAEieK82t+My9tday6P9m+xr4EBUG0yBPC8BUzCY0xo0=
X-Received: by 2002:a05:622a:13c8:b0:461:358e:d635 with SMTP id
 d75a77b69052e-471685b8925mr2831741cf.18.1738923375596; Fri, 07 Feb 2025
 02:16:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe> <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162> <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
 <20250131204920.GA1974131@ax162> <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>
 <20250206171036.GF180182@ax162> <20250207025127.2sy74bhcu6wtbo6a@jpoimboe>
In-Reply-To: <20250207025127.2sy74bhcu6wtbo6a@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 7 Feb 2025 11:16:04 +0100
X-Gm-Features: AWEUYZlqVEPOKmDPwURyXi8JcqEovqZ4UT5KSclG2S9lxGoccrNZI3F2eMG33uc
Message-ID: <CA+i-1C0eNAMvRtZTZ8yNT2TwC1tgLqP=9T=t38eWdaznFoS+xQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 03:51, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> I didn't quite follow the OBJTOOL_FLAGS idea.  We already have
> OBJTOOL_ARGS which allows adding arguments (though not removing them),
> was it mean to be something like that?

Oh. Yeah, exactly that. Nothing to do on this point then.
