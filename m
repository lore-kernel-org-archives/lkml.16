Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAC7205AA5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590930; cv=none; b=Ukho57Td9LfKIHXVwaX+8EYUVnB1J4Kej8VbE4EYNT5+PMwOQsQmdAEHygngzG6q1kyT4cPfTRRYgrGLs5lNEeKHKsbECsJHbfVUvoyvqLO0Lc3OCAuQs3Wyg7xx01BX6Md9D43rkPC06Xdd0AvwSI0hkQA2Il7b4ZAH8KSv+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590930; c=relaxed/simple;
	bh=tkSWnhzAStqmt84odRgmRpvkxz8GYCv4hn4IseLKlRQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GhYZMw6HwsKFedqEm0auetq11qIoRLhkAoSAQc+qy7IoSlH+f35pXlsOpu3AdJcOiPsr56DjoXCKCx5zwSuyA1B8RPSGd4fCjdg+mB4Zimd2rzmrhI0E2g3/rIgxbO5nSh5XJ3NzeG8w8xZF7VLQB485IL9tiSfSzBteAHhT86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id D824292009C; Mon,  3 Feb 2025 14:55:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D244E92009B;
	Mon,  3 Feb 2025 13:55:25 +0000 (GMT)
Date: Mon, 3 Feb 2025 13:55:25 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Amit <amitchoudhary0523@gmail.com>
cc: linux-kernel@vger.kernel.org
Subject: Re: Advantages of crashing if someone is freeing NULL pointer.
In-Reply-To: <CAFf+5zgU2A4PmOm06Ca654UgLErJbfMTK5XhnR5X2D0Jz2J-SA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2502030338010.41663@angie.orcam.me.uk>
References: <CAFf+5zgU2A4PmOm06Ca654UgLErJbfMTK5XhnR5X2D0Jz2J-SA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jan 2025, Amit wrote:

> If people here agree with me then I will also try to get free(NULL) to
> crash in the C library - I will talk to them and send a patch if they
> agree. But first, I wanted to see if people here agree with me or not.

 ISO C requires that free(NULL) return with no action.

  Maciej
