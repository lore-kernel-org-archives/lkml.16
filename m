Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1E21EDA04
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747120876; cv=none; b=C1xAtVcXYl9h+FnZxMrXSXlGPoEY35Xgxhn2R6ab3NQt3DPR8fJ9uQXDWd6MIWptviuQau3Chio6FvkoiW8iTyq0rhEtjFYWqmoKS04w6oYoD/EyzP/4ebxfDeAu74cfkix6Q2VhOZN/Q1uz9JAK8wYhVYhxM+rfaDDDtgc0r8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747120876; c=relaxed/simple;
	bh=PLFaKLspSKToI3oqLpHdbvqIWaZvRsqCO8+SeTZd87U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gWTCmgLI3/bCIlCjQy2lEuY0SCEWodHYIArHP37j/gcvepT//fG5Olr00z9SbEIwc5dFRYuoT2pIDeVfrepPd+MtqQP8d/8FUIPaI4rUAZqR8nmJ+Ny59yYjnvhdlXUQzs9MH2ClR5ngoMPQHh+caWzREfWB5FXs5TLpfzr1RKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=gL97HjRe; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="gL97HjRe"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476f4e9cf92so44338241cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747120873; x=1747725673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PLFaKLspSKToI3oqLpHdbvqIWaZvRsqCO8+SeTZd87U=;
        b=gL97HjRet5Mr5ftzdY4oHXdcf61sHnOiRXx8stWd7KnxN76vS7YuUXWDkvJ1Du3xNn
         jOEudV089dHHWxkOq9mktYe4nWX14OT5DMPisHZMvY/Fr8UZPLdHCy6YfeIfKJX9xb81
         Wvdf3fW9MykoLIXA8V7lMpAX0Z6WLylH9igY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747120873; x=1747725673;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLFaKLspSKToI3oqLpHdbvqIWaZvRsqCO8+SeTZd87U=;
        b=kqgCAiRNd4UqNg8IFUPwog9ua62Vtqzjb1oFcs9eDb+nJbLUN3fYGI8N91h7V9i69i
         F7s1BZ8kSVCJEN1+bWEgMbZ7Ozqx7dMSue3au+eEZA7ZrCCx0Zay7qWzFZlorn75mZ8E
         FSgCGoa6DvyHbApJFy7DsrtASJGbiHE/mO5/B5pWXGVmZnAiIvu3hmD8g6iBT7zTQOPJ
         rjtrxSpw3sdBgnSaqta6wlB2pmzXEtNSSauqjmJ145wEQO15G9cOuGwSaDFc7OPOPWIa
         32qvZ3yBqdWKu5eHAl5fZHt5IrWlm1HZwemuNI/POzB9JXKTHhYSH27AXme6Tm8bN5C2
         cbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYUGdGI0c3pCr6rGMdM94d34GFbnedSRSWkFPIXB41IgGTxuwL+wdLzslxPsCiU43N+LHsoNLa31F+z9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw86xIHixxBDyeAGPXnfh3/lpgGF97rbLu3Wyr3E9covgKUl5Gw
	cnzrmaHzxFWjQXQWraOA6Y5LU1YQDYhvtUhXzuQulo4wWDEWr7JK5+VlP4OERxb4q/Nv7JYV6u2
	m/zasnrkO3ZBP2igxv6+gWAgCWRpNce/XhCZDzdLwwiVPewO6
X-Gm-Gg: ASbGncuDqmbtFS+eVBRLNlB1LsYaHrNVYUZsVHer5XX6EDWJ3BmJypfsQYlpYLSD5P8
	ml6wgiTbPdOL5ms6ZcZDQlpKChmiCHsCwsE1i9+5+NsRypxiLJEvz88cVLQ9A3int/CtWVWdXqM
	+4WppkcG5VGzUsDI1gqY9DPHfKiuaAJ0k=
X-Google-Smtp-Source: AGHT+IF0jKCY6qBfrrbWJutfc3aUfMOlMt2zBXsEqu/zkNv0mZoBUk28w6GwEr1MaUwndic1EXLiRZCU9DSDvgZx0mg=
X-Received: by 2002:ac8:7d51:0:b0:477:5d31:9c3f with SMTP id
 d75a77b69052e-494527d4685mr283612521cf.42.1747120872990; Tue, 13 May 2025
 00:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513042049.63619-2-chenlinxuan@uniontech.com>
In-Reply-To: <20250513042049.63619-2-chenlinxuan@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 13 May 2025 09:21:01 +0200
X-Gm-Features: AX0GCFseOYu9DYFE8yAl84-gPqgQft2sZTfecQhV4mIznFelrLabrsX9eiIzL6E
Message-ID: <CAJfpeguWa-gWj-2WBWY=UVXATHKvAPKYMj7nbxTTg-_=0+hOxw@mail.gmail.com>
Subject: Re: [PATCH] fs: fuse: add dev id to /dev/fuse fdinfo
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 06:21, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
>
> This commit add fuse connection device id to
> fdinfo of opened /dev/fuse files.
>
> Related discussions can be found at links below.

Applied thanks.

Miklos
