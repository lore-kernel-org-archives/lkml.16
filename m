Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540AD2AE68
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747089247; cv=none; b=iYQRrob5K9uPpoMxIKlehye30OPCWDIh6PFbUF91DC2o5OatTdP0bmHWgV/b93oSH+27JRfqsNuj3LKh5CPByjq4Bwb6E4ioeN/scCkQ0clVi6Qpvb5UdqicPKD57YAtdROWv4L+J1OpYsHFaAB4jFKSoiZ+OLv7t9L8xVjebJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747089247; c=relaxed/simple;
	bh=A7GYuU5S8XhF1VDVZzU9l/kxFV62Z1n6qxJiHG7VNb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QhoM6qp9ENXmSjYuWBP+8+ulIE+/qqXGIdqcBBiYnGNNiw4zcuaHJrsDwKXT191e3rWTZIQb2ix0B8a96VLUBWElccGJfYrzi/Yas+Oxq+n1QggdmDewaCT+Gp6NIvsFAEdmiuKb3ooU+nWugi/LGEVS6FqT8PBhkxfqHJ64pt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pd7ap0zv; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pd7ap0zv"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7b2c28f661so304149276.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747089245; x=1747694045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8NvmZ4t3qL9Eye01seggkdjFmX2M4YFQw5Fn8XZFvI=;
        b=Pd7ap0zv89W2zj3j+5qRFM8THTtmFoJpOF70syXx9PnCWnC7SB6idcnKkp6L3jv1iF
         jvfVo/kekoas2uVMOBvkdWnAQ2a7FCDC2YODb0JX5DAuTz8+pPy7tN7PH63SNhemAuqg
         r8kC24WHSqysImnm0IIrr1E4kRNveoz5y5GPnKqbeJBGNMwCPm0yjJNJNh/K5kMMq8nT
         hPK651Ld2RDKsw+Z5/3I2Bg8EyuNP2Gl1eEKYCujmsBD5R7MgHZ3TabMcOsGUg0n9o/e
         miUSZz6V9JTFJbtrSXvEjconl4n0+vXenAtE4NGPs9Lc/24CeSrnwxMqEkm7Kr4kZlB2
         4JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747089245; x=1747694045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8NvmZ4t3qL9Eye01seggkdjFmX2M4YFQw5Fn8XZFvI=;
        b=acuPQd8kN4UFs01Ima4UV3B0Jo2AEnYde7iAzQG459zYbH5byBOxQ3BoNJSfqn9651
         kxTdXp+zfZAtXgBWQyKAqM3m2asIFliN4TvAqOJ+X58BhQlkaQmEAWq5C/Fxj52x7/OC
         DBryfcPvBvPZhL8zZ6SdH0VA9o5dfEsr8g8XeBDmelwVxgzUrM64cUEjfx5eyhKG20nb
         rEVIwyxg1lh69Dmr7omQWH0fvf213w7v8KQ9pPc0JNvdU0wAT1HgFHHvR4wOvXVaCjmC
         C4m42RPrUU39X1bjnualL1cMRgU0lkh5AZpip4r4eZtzBJ4Lofzw1NLzdFcERFmxve0X
         kG3A==
X-Forwarded-Encrypted: i=1; AJvYcCVEEsFolj+3DylHsr6vglzDYlW27zwKrVgoBBTNNWktJSSg9Xovag7V9qVpZXGTie5XkxNcV6ac/XBQNpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX1U9ULiDxBkC+z4OizuJZF9pzT6mZAgHQIkd5mzWnHoP/TT0N
	t5V+mQ0rkH765Vy79R1GdASiIifF7rsE9wdNDGFLrcTYupef/Q4kiI0zvMIjujwj3YSBebthG5X
	D2wpdEfi+Ax6QWYfmAhZFxzPbMUe/sfDEMsDP
X-Gm-Gg: ASbGncuJtpVnA3cpqfl5JYMT5w9EDgPbVZewo19EGbkq+jUoqbIMd3L9HzSbDZAdUrn
	xBThlWtAiqZlbe0csam/YjxIPIPTocuVLn6hyskg7D/tQ4YL+UqnsEC7W0GqHO61ZJNHLgCRJCk
	U/pHf/vdro8htk1p86vZh/p+qRMACABdEhX3UPGDAwZa4nRRdmzXsRCOWOEsj++jQ=
X-Google-Smtp-Source: AGHT+IHeFZuz1GT0pyYV9KRgJiE7kVcoZ8mYUC97W8Uis3XkL8RZr56UHHc0eEJMA4/5nNTsncrykr7QBqACs6gvE0Y=
X-Received: by 2002:a05:690c:4881:b0:708:c18d:e6ac with SMTP id
 00721157ae682-70a3fa373e6mr212777607b3.18.1747089245033; Mon, 12 May 2025
 15:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508141012.1411952-1-seanjc@google.com> <20250508141012.1411952-6-seanjc@google.com>
In-Reply-To: <20250508141012.1411952-6-seanjc@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 12 May 2025 15:33:29 -0700
X-Gm-Features: AX0GCFshITqfMDo56zZ68RKI2JYQJwtS2D7bd8OPkNI7R9wgfKIsD_-OmUB-WOs
Message-ID: <CADrL8HWwJqt+XL88_SYGta=AbOm=n6Zpt2jwHowkCbBkA+DOmg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] KVM: Use mask of harvested dirty ring entries to
 coalesce dirty ring resets
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 7:12=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> Use "mask" instead of a dedicated boolean to track whether or not there
> is at least one to-be-reset entry for the current slot+offset.  In the
> body of the loop, mask is zero only on the first iteration, i.e. !mask is
> equivalent to first_round.
>
> Opportunstically combine the adjacent "if (mask)" statements into a singl=
e
> if-statement.
>
> No function change intended.

nit: "Opportunistically" and "functional" :)

>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Yan Zhao <yan.y.zhao@intel.com>
> Cc: Maxim Levitsky <mlevitsk@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks, Sean! This logic is much easier to read now.

Feel free to add to the entire series if you'd like:

Reviewed-by: James Houghton <jthoughton@google.com>
